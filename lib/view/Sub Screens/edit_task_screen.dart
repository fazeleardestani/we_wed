import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:we_wed/controller/date_picker_controller.dart';
import 'package:we_wed/controller/tasks_controller.dart';
import 'package:we_wed/gen/assets.gen.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';
import '../../models/task_category.dart';
import '../../models/task_model.dart';
import '../../widgets/show_snack_bar.dart';
import '../../widgets/text_field.dart';

class EditTaskScreen extends StatefulWidget {
  final String taskId;

  const EditTaskScreen({super.key, required this.taskId});

  @override
  // ignore: library_private_types_in_public_api
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TasksController controller = Get.put(TasksController());
  final DatePickerController dateController = Get.put(DatePickerController());

  late RxString selectedCtegory;

  @override
  void initState() {
    super.initState();
    // Fetch task details and populate the controllers
    TaskModel? task = controller.tasks.firstWhereOrNull(
      (task) => task.taskId == widget.taskId,
    );
    if (task != null) {
      controller.titleController.text = task.title;
      controller.descriptionController.text = task.description;
      controller.dropdownValue.value = task.category;
      dateController.selectedDate.value = task.dateTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                MyStrings.editTask,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ),
            SvgPicture.asset(Assets.icons.bloomLeft.path),
          ],
        ),
      ),
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                constraints: BoxConstraints(
                  maxHeight: height - height / 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.taskTitle,
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 8),
                    CustomTextFieldWidget(
                      hintText: MyStrings.taskTitle,
                      borderRadius: BorderRadius.circular(8),
                      borderColor: SolidColors.grey50,
                      height: height / 16.91,
                      textEditingController: controller.titleController,
                      textInputType: TextInputType.text,
                      boxColor: Natural.white,
                    ),
                    SizedBox(height: height / 34),
                    Text(
                      MyStrings.taskDescriptionTitle,
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 8),
                    CustomTextFieldWidget(
                      hintText: MyStrings.taskDescription,
                      borderRadius: BorderRadius.circular(8),
                      maxLines: 5,
                      borderColor: SolidColors.grey50,
                      height: height / 16.91,
                      textEditingController: controller.descriptionController,
                      textInputType: TextInputType.text,
                      boxColor: Natural.white,
                    ),
                    SizedBox(height: height / 34),
                    Text(
                      MyStrings.category,
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                        height: height / 16.91,
                        child: Obx(
                          () => DropdownMenu(
                              enableSearch: false,
                              width: width * 0.915,
                              initialSelection: controller.dropdownValue.value,
                              hintText: MyStrings.category,
                              onSelected: (String? value) {
                                selectedCtegory = value!.obs;
                                controller.dropdownValue = selectedCtegory;
                              },
                              dropdownMenuEntries: categoryList
                                  .map<DropdownMenuEntry<String>>(
                                      (RxString value) {
                                return DropdownMenuEntry<String>(
                                    value: value.value, label: value.value);
                              }).toList()),
                        )),
                    SizedBox(height: height / 34),
                    Text(
                      MyStrings.date,
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 8),
                    InkWell(
                      onTap: () {
                        // Handle the date picker tap event
                        dateController.pickDateWedding(context);
                      },
                      child: Container(
                        height: height / 16.91,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: Natural.defaultColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 1,
                            color: SolidColors.grey100,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => Text(
                                    dateController.selectedDate.value == '-'
                                        ? MyStrings.pickDay
                                        : dateController.selectedDate.value,
                                    style: Theme.of(context)
                                        .inputDecorationTheme
                                        .hintStyle,
                                  )),
                              const Icon(
                                Icons.calendar_month_rounded,
                                color: SolidColors.grey200,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height / 4.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 48,
                          width: width / 2,
                          child: ElevatedButton(
                            onPressed: () {
                              if (controller.titleController.text.isNotEmpty) {
                                controller.updateTask(
                                  taskId: widget.taskId,
                                  name: 'title',
                                  newData: controller.titleController.text,
                                );
                                controller.updateTask(
                                  taskId: widget.taskId,
                                  name: 'description',
                                  newData:
                                      controller.descriptionController.text,
                                );
                                controller.updateTask(
                                  taskId: widget.taskId,
                                  name: 'category',
                                  newData: controller.dropdownValue.value,
                                );
                                controller.updateTask(
                                  taskId: widget.taskId,
                                  name: 'dateTime',
                                  newData: dateController.selectedDate.value,
                                );
                                // Clear the data after updating the task and navigating back
                                controller.titleController.clear();
                                controller.descriptionController.clear();
                                controller.dropdownValue.value =
                                    MyStrings.category;
                                dateController.selectedDate.value = '-';
                                Get.back();
                              } else {
                                showSnackBar(
                                  MyStrings.errorStatus,
                                  MyStrings.enterAllTheFields,
                                  Semantic.errorMain,
                                );
                              }
                            },
                            style: Theme.of(context).elevatedButtonTheme.style,
                            child: Text(
                              MyStrings.updateTask,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        SizedBox(
                          height: 48,
                          width: width / 3,
                          child: TextButton(
                              onPressed: () {
                                controller.titleController.clear();
                                controller.descriptionController.clear();
                                controller.dropdownValue.value =
                                    MyStrings.category;
                                dateController.selectedDate.value = '-';
                                Get.back();
                              },
                              child: const Text(
                                MyStrings.cancel,
                                style: TextStyle(
                                  color: SolidColors.violetText,
                                  fontSize: 14,
                                  fontFamily: 'Iranyekan',
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height / 40,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
