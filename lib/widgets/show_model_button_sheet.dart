import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_wed/controller/date_picker_controller.dart';
import 'package:we_wed/models/task_category.dart';
import 'package:we_wed/widgets/show_snack_bar.dart';
import 'package:we_wed/widgets/text_field.dart';
import '../controller/tasks_controller.dart';
import '../utils/my_colors.dart';
import '../utils/my_strings.dart';

// ignore: must_be_immutable
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
  RxString selectedCtegory = ''.obs;

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
                      width: widget.width * 0.915,
                      initialSelection: MyStrings.category,
                      hintText: MyStrings.category,
                      onSelected: (String? value) {
                        selectedCtegory = value!.obs;
                        widget.controller.dropdownValue = selectedCtegory;
                      },
                      dropdownMenuEntries: categoryList
                          .map<DropdownMenuEntry<String>>((RxString value) {
                        return DropdownMenuEntry<String>(
                            value: value.value, label: value.value);
                      }).toList()),
                )),

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
                            widget.dateController.selectedDate.value == '-'
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
                  onPressed: () {
                    if (widget.controller.titleController.text.isNotEmpty &&
                        widget.controller.dropdownValue.value !=
                            MyStrings.category) {
                      widget.controller
                          .createTask(widget.dateController.selectedDate);
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
                )),
          ],
        ),
      ),
    );
  }
}
