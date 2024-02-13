import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:we_wed/controller/tasks_controller.dart';
import 'package:we_wed/models/fake_data.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';
import '../../controller/main_controller.dart';
import '../../gen/assets.gen.dart';
import '../../routes/names.dart';
import '../../widgets/show_snack_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final MainController controller = Get.put(MainController());
  final TasksController tasksController = Get.put(TasksController());
  final Uri _url =
      Uri.parse('https://digipostal.ir/tag/online-wedding-invitation');

  @override
  Widget build(BuildContext context) {
    User user = FirebaseAuth.instance.currentUser!;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    double percent = 0.0;
    int totalTasks = tasksController.tasks.length;

    if (totalTasks != 0) {
      percent =
          (tasksController.completedTasks.length / totalTasks).clamp(0.0, 1.0);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Natural.white,
        foregroundColor: Natural.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.wewed.path,
              height: 28,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width / 1.8,
                      child: RichText(
                        text: TextSpan(
                          text:
                              '${MyStrings.hi} ${user.displayName?.split(' ').first}!',
                          style: Theme.of(context).textTheme.headlineSmall,
                          children: [
                            TextSpan(
                              text: MyStrings.welcomeText,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: Theme.of(context).elevatedButtonTheme.style,
                        onPressed: () {
                          controller.selectedPageIndex.value = 3;
                          // Get.toNamed(NamedRoute.tasksScreen);
                          // Get.offAndToNamed(NamedRoute.tasksScreen);
                        },
                        child: Text(
                          MyStrings.tasksList,
                          style: Theme.of(context).textTheme.labelMedium,
                        ))
                  ],
                ),
                SizedBox(
                  height: height / 55.0625,
                ),
                Container(
                  height: height / 12.58,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        Assets.images.doubleRing.path,
                        width: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0, height / 25.9, 0, height / 25.9),
                        child: LinearPercentIndicator(
                          width: width / 1.5,
                          alignment: MainAxisAlignment.center,
                          barRadius: const Radius.circular(100),
                          lineHeight: 5,
                          percent: percent,
                          progressColor: SolidColors.violetPrimery,
                          backgroundColor: SolidColors.grey50,
                        ),
                      ),
                      Image.asset(
                        Assets.images.singleRing.path,
                        width: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height / 29.36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.icons.bloomRight.path),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        MyStrings.servicesList,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    SvgPicture.asset(Assets.icons.bloomLeft.path),
                  ],
                ),
                SizedBox(
                  height: height / 55.0625,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: width / 23.43,
                    mainAxisSpacing: height / 44.05,
                  ),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
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
                      child: InkWell(
                        onTap: () {
                          if (categoryList[index].id == 1) {
                            controller.selectedPageIndex.value = 2;
                          } else {
                            showSnackBar(
                                MyStrings.errorStatus,
                                'این دسته بندی هنوز اضافه نشده!',
                                Semantic.errorMain);
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(categoryList[index].imagePath),
                            Text(
                              categoryList[index].title,
                              style: Theme.of(context).textTheme.bodySmall,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: height / 29.36,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(NamedRoute.costManagerScreen);
                  },
                  child: Container(
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
                          MyStrings.paymentManager,
                          style: Theme.of(context).textTheme.labelLarge,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 29.36,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.icons.bloomRight.path),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        MyStrings.inviteCard,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    SvgPicture.asset(Assets.icons.bloomLeft.path),
                  ],
                ),
                SizedBox(
                  height: height / 29.36,
                ),
                Stack(
                  children: [
                    SizedBox(
                        width: double.maxFinite,
                        height: height / 5,
                        child: Image.asset(
                          Assets.images.inviteCard.path,
                          fit: BoxFit.fitWidth,
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: height / 7.5),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _launchUrl(_url);
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: SolidColors.borderButton,
                                          width: 1),
                                      borderRadius: BorderRadius.circular(12))),
                              backgroundColor:
                                  MaterialStateProperty.resolveWith((states) {
                                return Natural.white;
                              }),
                              elevation: MaterialStateProperty.all(1)),
                          child: Text(MyStrings.createCard,
                              style: Theme.of(context).textTheme.headlineLarge),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: height / 13,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _launchUrl(url) async {
  if (!await launchUrl(url)) {
    log('Could not launch $url');
  }
}
