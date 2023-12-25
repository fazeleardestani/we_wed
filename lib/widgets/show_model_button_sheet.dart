import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_wed/controller/date_picker_controller.dart';
import 'package:we_wed/models/task_category.dart';
import 'package:we_wed/widgets/text_field.dart';
import '../controller/tasks_controller.dart';
import '../utils/my_colors.dart';
import '../utils/my_strings.dart';

class ShowModalSheet extends StatelessWidget {
  final TasksController controller;
  final DatePickerController dateController;
  final double height;
  final double width;
  RxString selectedCtegory = ''.obs;

  ShowModalSheet({
    super.key,
    required this.controller,
    required this.height,
    required this.width,
    required this.dateController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height / 1.3,
      decoration: const BoxDecoration(
        color: Natural.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        border: Border.symmetric(
          vertical: BorderSide(width: 1, color: SolidColors.grey100),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
              child: Text(
                MyStrings.taskInfo,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            // Title
            CustomTextFieldWidget(
              hintText: MyStrings.taskTitle,
              borderRadius: BorderRadius.circular(8),
              borderColor: SolidColors.grey50,
              height: height / 16.91,
              textEditingController: controller.titleController,
              textInputType: TextInputType.text,
              boxColor: Natural.white,
            ),
            // Description
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
            // Categories
            SizedBox.fromSize(
              child: DropdownMenu(
                  enableSearch: false,
                  width: width * 0.935,
                  initialSelection: MyStrings.category,
                  hintText: MyStrings.category,
                  onSelected: (String? value) {
                    selectedCtegory.value = value!;
                  },
                  dropdownMenuEntries: categoryList
                      .map<DropdownMenuEntry<String>>((RxString value) {
                    return DropdownMenuEntry<String>(
                        value: value.value, label: value.value);
                  }).toList()),
            ),

            // Date picker
            InkWell(
              onTap: () {
                // Handle the date picker tap event
                dateController.pickDateWedding(context);
              },
              child: Container(
                height: 48,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Natural.defaultColor,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    style: BorderStyle.solid,
                    width: 1,
                    color: SolidColors.violetPrimery,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() => Text(
                            dateController.selectedDate.value == ''
                                ? MyStrings.pickDay
                                : dateController.selectedDate.value,
                            style: Theme.of(context)
                                .inputDecorationTheme
                                .hintStyle,
                          )),
                      const Icon(
                        Icons.calendar_month_rounded,
                        color: SolidColors.violetPrimery,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Create Button
            SizedBox(
              height: 48,
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () {
                  controller.createTask(dateController);
                  Get.back();
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(
                  MyStrings.addTask,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
