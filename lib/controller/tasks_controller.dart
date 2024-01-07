import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/task_model.dart';
import '../utils/my_colors.dart';
import '../utils/my_strings.dart';
import '../widgets/show_snack_bar.dart';

class TasksController extends GetxController {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  RxString selectedDate = '-'.obs;
  RxString dropdownValue = MyStrings.category.obs;
  RxList<TaskModel> tasks = <TaskModel>[].obs;
  RxList<TaskModel> completedTasks = <TaskModel>[].obs;
  RxList<TaskModel> incompleteTasks = <TaskModel>[].obs;

  User user = FirebaseAuth.instance.currentUser!;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
    updateLists();
  }

  Future<void> createTask(RxString selectedDate) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('tasks')
          .add({
        'title': titleController.text,
        'description':
            descriptionController.text == "" ? '-' : descriptionController.text,
        'category': dropdownValue.value,
        'status': false,
        'dateTime': selectedDate.value == "" ? '-' : selectedDate.value,
      });

      showSnackBar(
        MyStrings.successStatus,
        MyStrings.successCreatedTask,
        Semantic.successMain,
      );

      titleController.clear();
      descriptionController.clear();
      dropdownValue.value = MyStrings.category;
      selectedDate.value = '-';

      await fetchTasks();
      updateLists();
      // Fetch tasks after creating a new one
    } catch (error) {
      log('Error creating task: $error');
      showSnackBar(
        MyStrings.errorStatus,
        MyStrings.pleaseTryAgain,
        Semantic.errorMain,
      );
    }
  }

  void updateLists() {
    completedTasks.value = tasks.where((task) => task.status == true).toList();
    incompleteTasks.value =
        tasks.where((task) => task.status == false).toList();
  }

  Future<void> fetchTasks() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('tasks')
          .get();

      tasks.assignAll(
        querySnapshot.docs
            .map((task) => TaskModel.fromMap(
                  task.id,
                  task.data() as Map<String, dynamic>,
                ))
            .toList(),
      );

      updateLists();

      update();
    } catch (error) {
      log('Error fetching tasks: $error');
    }
  }

  Future<void> deleteTask(String taskId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('tasks')
          .doc(taskId)
          .delete();

      await fetchTasks();
      updateLists();
      // Fetch tasks after deleting one
    } catch (error) {
      log('Error deleting task: $error');
      showSnackBar(
        MyStrings.errorStatus,
        MyStrings.pleaseTryAgain,
        Semantic.errorMain,
      );
    }
  }

  Future<void> updateTask({
    required String? name,
    required dynamic newData,
    required String taskId,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .collection('tasks')
          .doc(taskId)
          .update({'$name': newData});

      log("Task Updated");

      await fetchTasks();
      updateLists();
      // Fetch tasks after updating one
    } catch (error) {
      log("Failed to update task: $error");
    }
  }
}
