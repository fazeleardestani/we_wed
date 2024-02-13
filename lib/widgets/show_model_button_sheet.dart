import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_wed/controller/date_picker_controller.dart';
import 'package:we_wed/models/task_category.dart';

import 'package:we_wed/widgets/show_snack_bar.dart';
import 'package:we_wed/widgets/text_field.dart';
import '../controller/tasks_controller.dart';
import '../services/notification_service.dart';
import '../utils/my_colors.dart';
import '../utils/my_strings.dart';

class ShowModalSheet extends StatefulWidget {
  final TasksController controller;
  final DatePickerController dateController;
  final double height;
  final double width;

  const ShowModalSheet({
    super.key,
    required this.controller,
    required this.height,
    required this.width,
    required this.dateController,
  });

  @override
  State<ShowModalSheet> createState() => _ShowModalSheetState();
}

class _ShowModalSheetState extends State<ShowModalSheet> {
  RxString selectedCategory = ''.obs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height / 1.5,
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              height: widget.height / 16.91,
              textEditingController: widget.controller.titleController,
              textInputType: TextInputType.text,
              boxColor: Natural.white,
            ),
            // Description
            CustomTextFieldWidget(
              hintText: MyStrings.taskDescription,
              borderRadius: BorderRadius.circular(8),
              maxLines: 5,
              borderColor: SolidColors.grey50,
              height: widget.height / 16.91,
              textEditingController: widget.controller.descriptionController,
              textInputType: TextInputType.text,
              boxColor: Natural.white,
            ),
            // Categories
            SizedBox(
              height: widget.height / 16.91,
              child: Obx(
                () => DropdownMenu(
                  enableSearch: false,
                  width: widget.width * 0.935,
                  initialSelection: MyStrings.category,
                  hintText: MyStrings.category,
                  onSelected: (String? value) {
                    selectedCategory = value!.obs;
                    widget.controller.dropdownValue = selectedCategory;
                  },
                  dropdownMenuEntries: categoryList
                      .map<DropdownMenuEntry<String>>((RxString value) {
                    return DropdownMenuEntry<String>(
                      value: value.value,
                      label: value.value,
                    );
                  }).toList(),
                ),
              ),
            ),

            // Date picker
            InkWell(
              onTap: () {
                // Handle the date picker tap event
                widget.dateController.pickDateWedding(context);
              },
              child: Container(
                height: widget.height / 16.91,
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
                            widget.dateController.selectedDate.value == '-' ||
                                    widget.dateController.selectedDate.value ==
                                        ''
                                ? MyStrings.pickDay
                                : widget.dateController.selectedDate.value,
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

            // Create Button
            SizedBox(
              height: 48,
              width: double.maxFinite,
              child: ElevatedButton(
                onPressed: () async {
                  if (widget.controller.titleController.text.isNotEmpty &&
                      widget.controller.dropdownValue.value !=
                          MyStrings.category) {
                    // Create the task and schedule a notification
                    widget.controller.createTask(
                      widget.dateController.selectedDate,
                    );
                    await NotificationService().showScheduledNotification(
                      0, // شناسه منحصر به فرد نوتیفیکیشن
                      'تست نوتیفیکیشن', // عنوان نوتیفیکیشن
                      'این یک نوتیفیکیشن تستی است.', // متن نوتیفیکیشن
                    );

                    if (widget.dateController.selectedDate.value != '-' &&
                        widget.dateController.selectedDate.value != '') {
                      // Schedule a notification for the selected date
                      String title = widget.controller.titleController.text;
                      String body = 'You have a new task to complete.';
                      String jalaliDate =
                          widget.dateController.selectedDate.value;

                      // از NotificationService برای برنامه‌ریزی نوتیفیکیشن استفاده کنید
                      // await NotificationService().showNotification(
                      //   math.Random().nextInt(
                      //       1000), // برای مثال، یک شناسه تصادفی برای نوتیفیکیشن
                      //   title,
                      //   body,
                      //   jalaliDate,
                      // );
                      log('Notification scheduled for $jalaliDate');
                    }

                    Get.back(); // Close the bottom sheet
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
