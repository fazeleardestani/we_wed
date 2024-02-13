import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:we_wed/models/cost_model.dart';
import '../resources/auth_methods.dart';
import '../utils/my_colors.dart';
import '../utils/my_strings.dart';
import '../widgets/show_snack_bar.dart';
import 'package:we_wed/models/user_model.dart' as model;

class CostManagerController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController costController = TextEditingController();

  RxString selectedDate = '-'.obs;
  RxList<CostModel> costs = <CostModel>[].obs;

  User user = FirebaseAuth.instance.currentUser!;

  RxInt totalCost = 0.obs;

  @override
  void onInit() async {
    super.onInit();

    fetchCosts();
  }

  @override
  void onClose() {
    _saveTotalCost();
    super.onClose();
  }

  Future<void> createCost(RxString selectedDate) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('costs')
          .add({
        'title': titleController.text,
        'description':
            descriptionController.text == "" ? '-' : descriptionController.text,
        'cost': costController.text,
        'dateTime': selectedDate.value == "" ? '-' : selectedDate.value,
      });

      totalCost += int.tryParse(costController.text)!;
      await AuthMethods().updateUserTotalCost(user.uid, totalCost.value);

      showSnackBar(
        MyStrings.successStatus,
        MyStrings.successCreatedTask,
        Semantic.successMain,
      );

      titleController.clear();
      descriptionController.clear();
      costController.clear();
      selectedDate.value = '-';

      await fetchCosts();
      _saveTotalCost();
    } catch (error) {
      log('Error creating cost: $error');
      showSnackBar(
        MyStrings.errorStatus,
        MyStrings.pleaseTryAgain,
        Semantic.errorMain,
      );
    }
  }

  Future<void> fetchCosts() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('costs')
          .get();

      costs.assignAll(
        querySnapshot.docs
            .map((cost) => CostModel.fromMap(
                  cost.id,
                  cost.data() as Map<String, dynamic>,
                ))
            .toList(),
      );

      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();

      totalCost.value = model.User.fromSnap(snapshot).totalCost;

      update();
    } catch (error) {
      log('Error fetching costs: $error');
    }
  }

  Future<void> deleteCost(String costId, int cost) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('costs')
          .doc(costId)
          .delete();

      totalCost -= cost;
      await AuthMethods().updateUserTotalCost(user.uid, totalCost.value);

      await fetchCosts();
      _saveTotalCost();
    } catch (error) {
      log('Error deleting cost: $error');
      showSnackBar(
        MyStrings.errorStatus,
        MyStrings.pleaseTryAgain,
        Semantic.errorMain,
      );
    }
  }

  Future<void> _saveTotalCost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('totalCost', totalCost.value);
    fetchCosts();
  }

  // Future<int> _loadTotalCost() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   int savedTotalCost = prefs.getInt('totalCost') ?? totalCost.value;
  //   return savedTotalCost;
  // }

  String formatNumber(int number) {
    final format = NumberFormat(
        '###,###,###,###,###,###,###,###,###,###,###,###,###,###,###,###,###,###,###,###,###,###,###,###,###');
    return format.format(number).toString();
  }
}





  // Future<void> updateTask({
  //   required String? name,
  //   required dynamic newData,
  //   required String costId,
  // }) async {
  //   try {
  //     await FirebaseFirestore.instance
  //         .collection('users')
  //         .doc(user.uid)
  //         .collection('costs')
  //         .doc(costId)
  //         .update({'$name': newData});

  //     log("Cost Updated");

  //     await fetchCosts();
  //     // Fetch tasks after updating one
  //   } catch (error) {
  //     log("Failed to update cost: $error");
  //   }
  // }

