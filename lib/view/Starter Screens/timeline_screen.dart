import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';
import '../../controller/date_picker_controller.dart';
import '../../gen/assets.gen.dart';
import '../../routes/names.dart';

class TimeLineScreen extends StatelessWidget {
  final picker = Get.put(DatePickerController());
  TimeLineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double hight = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
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
              currentStep: 2,
              progressColor: SolidColors.violetPrimery,
              backgroundColor: SolidColors.grey50,
            ),
            SizedBox(
              height: hight / 17,
            ),
            Text(
              picker.rangeDuration.toString(),
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(MyStrings.doYouWantToPlanForTheBestDay,
                style: Theme.of(context).textTheme.displaySmall),
            SizedBox(
              height: hight / 23.2,
            ),
            SvgPicture.asset(
              Assets.images.timeline.path,
              height: hight / 2,
            ),
            SizedBox(
              height: hight / 23.2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 48,
                  width: width / 2,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAndToNamed(NamedRoute.mainScreen);
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(MyStrings.goToHomePage,
                        style: Theme.of(context).textTheme.labelMedium),
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: width / 3,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.offAndToNamed(NamedRoute.pickDate);
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            side: const BorderSide(
                                color: SolidColors.borderButton, width: 1),
                            borderRadius: BorderRadius.circular(12))),
                        backgroundColor:
                            MaterialStateProperty.resolveWith((states) {
                          return Natural.defaultColor;
                        }),
                        elevation: MaterialStateProperty.all(0)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(MyStrings.previous,
                            style: Theme.of(context).textTheme.headlineLarge),
                        const SizedBox(width: 8),
                        SvgPicture.asset(
                          Assets.icons.arrowLeft.path,
                          colorFilter: const ColorFilter.mode(
                              SolidColors.violetPrimery, BlendMode.srcIn),
                        ),
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
