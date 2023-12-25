import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:we_wed/utils/my_strings.dart';
import 'package:we_wed/widgets/show_snack_bar.dart';

import '../models/task_model.dart';
import '../utils/my_colors.dart';

class TasksController extends GetxController {
  // Create controllers for title and description input fields
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  // Observable variables for selected date, dropdown value, and task list
  RxString selectedDate = ''.obs;
  RxString dropdownValue = MyStrings.category.obs;
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  // Get the current user from FirebaseAuth
  User user = FirebaseAuth.instance.currentUser!;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
  }

  // Function to create a new task and add it to Firestore

  Future<void> createTask(dateController) async {
    try {
      // Convert selectedDate.value to DateTime
      DateTime selectedDateTime =
          DateTime.parse(dateController.selectedDate.value);

      // Add task to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('Tasks')
          .add({
        'uid': user.uid,
        'title': titleController.text,
        'description': descriptionController.text,
        'category': dropdownValue.value,
        'dateTime': Timestamp.fromDate(selectedDateTime),
      });
      showSnackBar(MyStrings.successStatus, MyStrings.successCreatedTask,
          Semantic.successMain);

      // Clear input fields after adding the task
      titleController.clear();
      descriptionController.clear();
      dropdownValue.value = MyStrings.category;
      selectedDate.value = '';

      // به‌روزرسانی لیست وظایف
      fetchTasks();
    } catch (error) {
      log('Error creating task: $error');
      showSnackBar(
          MyStrings.errorStatus, MyStrings.pleaseTryAgain, Semantic.errorMain);
    }
  }

  // Function to fetch tasks from Firestore and update the task list
  void fetchTasks() async {
    try {
      // Fetch tasks from Firestore
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('Tasks')
          .get();
      tasks.assignAll(querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return TaskModel(
          userId: data['uid'],
          title: data['title'],
          description: data['description'],
          category: data['category'],
          dateTime: data['dateTime'],
        );
      }).toList());
    } catch (error) {
      log('Error fetching tasks: $error');
    }
  }
}
