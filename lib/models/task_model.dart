import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String userId;
  String title;
  String description;
  String category;
  Timestamp dateTime;

  TaskModel({
    required this.userId,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.category,
  });

  factory TaskModel.fromMap(String userId, Map<String, dynamic> data) {
    String title = data['title'];
    String description = data['description'];
    String category = data['category'];
    Timestamp timestamp = data['dateTime'];

    return TaskModel(
      userId: userId,
      title: title,
      description: description,
      category: category,
      dateTime: timestamp,
    );
  }
}
