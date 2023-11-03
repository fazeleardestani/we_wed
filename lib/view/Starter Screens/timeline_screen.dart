import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:linear_progress_bar/linear_progress_bar.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';
import '../../controller/date_picker_controller.dart';
import '../../gen/assets.gen.dart';
import '../../route_manager/names.dart';

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
            SvgPicture.asset(Assets.images.timeline.path),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 48,
                  width: width / 2.3,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.icons.arrowLeft.path),
                    label: Text(MyStrings.next,
                        style: Theme.of(context).textTheme.labelMedium),
                    style: Theme.of(context).elevatedButtonTheme.style,
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: width / 2.3,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Get.offAndToNamed(NamedRoute.pickDate);
                    },
                    icon: SvgPicture.asset(Assets.icons.arrowLeft.path),
                    label: Text(MyStrings.next,
                        style: Theme.of(context).textTheme.labelMedium),
                    style: Theme.of(context).elevatedButtonTheme.style,
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
