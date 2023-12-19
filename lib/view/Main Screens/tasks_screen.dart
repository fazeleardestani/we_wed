import 'package:flutter/material.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Natural.white,
        centerTitle: true,
        title: Text(MyStrings.tasksList,
            style: Theme.of(context).textTheme.displayLarge),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(child: Center(child: Text("tasks screen"))),
      ),
    );
  }
}
