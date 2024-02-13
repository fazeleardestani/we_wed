import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:we_wed/controller/date_picker_controller.dart';
import 'package:we_wed/controller/tasks_controller.dart';
import 'package:we_wed/gen/assets.gen.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';
import 'package:we_wed/view/Sub%20Screens/edit_task_screen.dart';
import '../../models/task_model.dart';
import '../../widgets/show_model_button_sheet.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final TasksController controller = Get.put(TasksController());
  final DatePickerController dateController = Get.put(DatePickerController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Natural.white,
          foregroundColor: Natural.white,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.icons.bloomRight.path),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  MyStrings.tasksList,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SvgPicture.asset(Assets.icons.bloomLeft.path),
            ],
          ),
          
          bottom: const TabBar(
            tabs: [
              Tab(text: 'همه کارها'),
              Tab(text: 'انجام شده‌ها'),
              Tab(text: 'انجام نشده‌ها'),
            ],
          ),
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: height / 10),
          child: floatingButton(context, height, width),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: TabBarView(
              children: [
                buildTasksList(controller.tasks, width, height),
                buildTasksList(controller.completedTasks, width, height),
                buildTasksList(controller.incompleteTasks, width, height),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTasksList(List<TaskModel> tasks, width, height) {
    return Obx(() {
      if (tasks.isEmpty) {
        return const Center(
          child: Text(MyStrings.noTask),
        );
      } else {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: width / 31.25,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      height: height / 6,
                      decoration: BoxDecoration(
                        color: Natural.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: SolidColors.grey50,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 18),
                              child: SizedBox(
                                width: 16,
                                height: 16,
                                child: Checkbox(
                                    value: task.status,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        task.status = value!;
                                      });
                                      controller.updateTask(
                                        name: 'status',
                                        newData: value,
                                        taskId: task.taskId,
                                      );
                                    }),
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  task.title,
                                  style:
                                      Theme.of(context).textTheme.displayLarge,
                                ),
                                const SizedBox(
                                  height: 1,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      size: 16,
                                      Icons.description_outlined,
                                      color: SolidColors.violetPrimery,
                                    ),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: width / 3,
                                      child: Text(
                                        task.description,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      size: 16,
                                      Icons.date_range_rounded,
                                      color: SolidColors.violetPrimery,
                                    ),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: width / 3,
                                      child: Text(
                                        task.dateTime,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      size: 16,
                                      Icons.tag,
                                      color: SolidColors.violetPrimery,
                                    ),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: width / 3,
                                      child: Text(
                                        task.category,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: width / 2.7,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Get.to(EditTaskScreen(
                                            taskId: task.taskId));
                                      },
                                      icon: const Icon(
                                        size: 24,
                                        Icons.edit,
                                        color: SolidColors.violetPrimery,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        controller.deleteTask(task.taskId);
                                      },
                                      icon: const Icon(
                                        size: 24,
                                        Icons.delete,
                                        color: SolidColors.violetPrimery,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        controller.shareTaskData(task);
                                      },
                                      icon: const Icon(
                                        size: 24,
                                        Icons.share,
                                        color: SolidColors.violetPrimery,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: height / 13,
            )
          ],
        );
      }
    });
  }

  FloatingActionButton floatingButton(BuildContext context, height, width) {
    return FloatingActionButton.extended(
      backgroundColor: Natural.white,
      elevation: 4,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => ShowModalSheet(
            dateController: dateController,
            controller: controller,
            height: height,
            width: width,
          ),
        );
      },
      label: Text(
        MyStrings.addNewTask,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      icon: const Icon(
        Icons.add,
        color: SolidColors.violetPrimery,
      ),
    );
  }
}
