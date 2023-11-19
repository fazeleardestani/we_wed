import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';
import '../../controller/date_picker_controller.dart';
import '../../gen/assets.gen.dart';
import '../../routes/names.dart';

class DatePickerScreen extends StatelessWidget {
  final picker = Get.put(DatePickerController());
  DatePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LinearProgressBar(
              maxSteps: 2,
              progressType:
                  LinearProgressBar.progressTypeLinear, // Use Linear progress
              currentStep: 1,
              progressColor: SolidColors.violetPrimery,
              backgroundColor: SolidColors.grey50,
            ),
            SizedBox(
              height: hight / 12.12,
            ),
            SvgPicture.asset(Assets.images.calendar.path),
            SizedBox(
              height: hight / 7.8,
            ),
            SizedBox(
              width: double.maxFinite,
              child: Text(
                MyStrings.tellMeWeddingTime,
                style: Theme.of(context).textTheme.displayLarge,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.start,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () {
                picker.pickDate(context);
              },
              child: Container(
                width: double.maxFinite,
                height: 48,
                decoration: BoxDecoration(
                    color: Natural.defaultColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      style: BorderStyle.solid,
                      width: 1,
                      color: SolidColors.grey50,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Obx(() => Text(
                            picker.selectedDate.value == ''
                                ? MyStrings.chooseWeddingTime
                                : picker.selectedDate.value,
                            style: Theme.of(context)
                                .inputDecorationTheme
                                .hintStyle,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: SvgPicture.asset(
                        Assets.icons.calendar.path,
                        height: 24,
                        width: 24,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: hight / 13.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 48,
                  width: width / 2.4,
                  child: ElevatedButton(
                    onPressed: () {
                      // await user?.updateDisplayName("Jane Q. User");
                      Get.offAndToNamed(NamedRoute.timeLine);
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(MyStrings.next,
                            style: Theme.of(context).textTheme.labelMedium),
                        const SizedBox(width: 8),
                        SvgPicture.asset(Assets.icons.arrowLeft.path),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
