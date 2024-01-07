
class TaskModel {
  String taskId;
  String title;
  String description;
  String category;
  bool status;
  String dateTime;

  TaskModel(
      {required this.taskId,
      required this.title,
      this.description = '-',
      required this.dateTime,
      required this.category,
      required this.status});

  factory TaskModel.fromMap(String taskId, Map<String, dynamic> data) {
    String title = data['title'];
    String description = data['description'];
    String category = data['category'];
    bool status = data['status'];
    String dateTime = data['dateTime'];

    return TaskModel(
      taskId: taskId,
      title: title,
      description: description,
      category: category,
      status: status,
      dateTime: dateTime,
    );
  }
}
