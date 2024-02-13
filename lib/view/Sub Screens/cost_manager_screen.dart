import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:we_wed/controller/cost_manager_controller.dart';
import 'package:we_wed/models/cost_model.dart';
import '../../controller/date_picker_controller.dart';
import '../../gen/assets.gen.dart';
import '../../utils/my_colors.dart';
import '../../utils/my_strings.dart';
import '../../widgets/show_snack_bar.dart';
import '../../widgets/text_field.dart';

class CostManagerScreen extends StatefulWidget {
  const CostManagerScreen({super.key});

  @override
  State<CostManagerScreen> createState() => _CostManagerScreenState();
}

class _CostManagerScreenState extends State<CostManagerScreen> {
  final CostManagerController controller = Get.put(CostManagerController());
  final DatePickerController dateController = Get.put(DatePickerController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
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
                  MyStrings.costList,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SvgPicture.asset(Assets.icons.bloomLeft.path),
            ],
          ),
          automaticallyImplyLeading: false),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
          bottom: height / 45,
        ),
        child: floatingButton(context, height, width),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: buildCostsList(controller.costs, width, height),
        ),
      ),
    );
  }

  Widget buildCostsList(List<CostModel> costs, width, height) {
    return Obx(() {
      if (costs.isEmpty) {
        return const Center(
          child: Text(MyStrings.noCost),
        );
      } else {
        return Column(
          children: [
            Container(
              width: double.infinity,
              height: height / 11.77,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.calculate,
                    color: SolidColors.violetPrimery,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    MyStrings.totalCost,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  Text(
                    ' : ${controller.formatNumber(controller.totalCost.value).toString()}',
                    style: Theme.of(context).textTheme.labelLarge,
                  )
                ],
              ),
            ),
            SizedBox(
              height: height / 40,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: costs.length,
                itemBuilder: (context, index) {
                  final cost = costs[index];
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  cost.title,
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
                                      width: width / 2,
                                      child: Text(
                                        cost.description,
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
                                      width: width / 2,
                                      child: Text(
                                        cost.dateTime,
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
                                      Icons.monetization_on_outlined,
                                      color: SolidColors.violetPrimery,
                                    ),
                                    const SizedBox(width: 8),
                                    SizedBox(
                                      width: width / 2,
                                      child: Text(
                                        controller
                                            .formatNumber(cost.cost)
                                            .toString(),
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
                            IconButton(
                                onPressed: () {
                                  controller.deleteCost(cost.costId, cost.cost);
                                },
                                icon: const Icon(
                                  size: 24,
                                  Icons.delete,
                                  color: SolidColors.violetPrimery,
                                )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
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
        // showModalBottomSheet(
        //     isScrollControlled: true,
        //     context: context,
        //     builder: (context) {
        //       return const Placeholder();
        //     });
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                alignment: Alignment.center,
                titleTextStyle: Theme.of(context).textTheme.titleSmall,
                scrollable: true,
                title: const Text(
                  MyStrings.newCost,
                ),
                actions: [alertDialog(context, height, width)],
              );
            });
      },
      label: Text(
        MyStrings.addNewCost,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      icon: const Icon(
        Icons.add,
        color: SolidColors.violetPrimery,
      ),
    );
  }

  Column alertDialog(BuildContext context, height, width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
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
        SizedBox(
          height: height / 100,
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
        SizedBox(
          height: height / 100,
        ),
        // Costs
        CustomTextFieldWidget(
          hintText: MyStrings.costInt,
          borderRadius: BorderRadius.circular(8),
          borderColor: SolidColors.grey50,
          height: height / 16.91,
          textEditingController: controller.costController,
          textInputType: TextInputType.number,
          boxColor: Natural.white,
          // onChanged: (value) {
          //   int? parsedValue = int.tryParse(value.replaceAll(',', ''));
          //   if (parsedValue != null) {
          //     // فرمت مناسب را نمایش دهید
          //     controller.costInput.value =
          //         controller.formatNumber(parsedValue);
          //   }
          // }
        ),
        SizedBox(
          height: height / 100,
        ),
        // Date picker
        InkWell(
          onTap: () {
            // Handle the date picker tap event
            dateController.pickDateWedding(context);
          },
          child: Container(
            height: height / 16.91,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Natural.white,
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
                        dateController.selectedDate.value == '-' ||
                                dateController.selectedDate.value == ''
                            ? MyStrings.pickDay
                            : dateController.selectedDate.value,
                        style: Theme.of(context).inputDecorationTheme.hintStyle,
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
          height: height / 100,
        ),

        // Create Button
        SizedBox(
          height: 48,
          width: double.maxFinite,
          child: ElevatedButton(
            onPressed: () async {
              if (controller.titleController.text.isNotEmpty &&
                  controller.costController.text.isNotEmpty) {
                // Create the task and schedule a notification
                controller.createCost(
                  dateController.selectedDate,
                );

                if (dateController.selectedDate.value != '-' ||
                    dateController.selectedDate.value != '') {
                  // Register one-off notification task
                }
                Get.back();
                // Close the bottom sheet
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
              MyStrings.addCost,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ),
        ),
      ],
    );
  }
}
