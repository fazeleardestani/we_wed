import 'package:flutter/material.dart';
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: SafeArea(child: Center(child: Text("tasks screen"))),
    );
  }
}