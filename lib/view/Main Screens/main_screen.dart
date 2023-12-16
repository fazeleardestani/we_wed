import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_wed/utils/my_strings.dart';
import 'package:we_wed/view/Main%20Screens/home_screen.dart';
import 'package:we_wed/view/Main%20Screens/profile_screen.dart';
import 'package:we_wed/view/Main%20Screens/service_screen.dart';
import 'package:we_wed/view/Main%20Screens/tasks_screen.dart';
import '../../gen/assets.gen.dart';
import '../../utils/my_colors.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Natural.paper,
      appBar: AppBar(
        backgroundColor: Natural.paper,
        elevation: 0,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SvgPicture.asset(
            Assets.images.wewed.path,
            height: 28,
          )
        ]),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: IndexedStack(
              index: selectedPageIndex.value,
              children: [
                ProfileScreen(),
                const HomeScreen(),
                const ServiceScreen(),
                const TasksScreen(),
              ],
            ),
          ),
          BottomNavigation(
            changeScreen: (int value) {
              selectedPageIndex.value = value;
              return value;
            },
            height: height,
            width: width,
            selectedPageIndex: selectedPageIndex,
          )
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.height,
    required this.width,
    required this.changeScreen,
    required this.selectedPageIndex,
  });

  final double height;
  final double width;
  final Function(int value) changeScreen;
  final RxInt selectedPageIndex;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: height / 12.32,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: height / 15.03,
              width: width / 6.94,
              child: InkWell(
                autofocus: false,
                onTap: () => Obx(() => changeScreen(0)),
                child: Column(
                  children: [
                    Obx(
                      () => SvgPicture.asset(Assets.icons.profile.path,
                          height: 24,
                          width: 24,
                          colorFilter: ColorFilter.mode(
                            selectedPageIndex.value == 0
                                ? SolidColors.violetPrimery
                                : SolidColors.grey200,
                            BlendMode.srcIn,
                          )),
                    ),
                    Obx(() => Text(
                          MyStrings.profile,
                          style: selectedPageIndex.value == 0
                              ? Theme.of(context).textTheme.labelSmall
                              : Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle,
                        ))
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => Obx(() => changeScreen(1)),
              child: Column(
                children: [
                  Obx(
                    () => SvgPicture.asset(Assets.icons.home.path,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          selectedPageIndex.value == 1
                              ? SolidColors.violetPrimery
                              : SolidColors.grey200,
                          BlendMode.srcIn,
                        )),
                  ),
                  Obx(() => Text(
                        MyStrings.home,
                        style: selectedPageIndex.value == 1
                            ? Theme.of(context).textTheme.labelSmall
                            : Theme.of(context).inputDecorationTheme.labelStyle,
                      ))
                ],
              ),
            ),
            InkWell(
              onTap: () => Obx(() => changeScreen(2)),
              child: Column(
                children: [
                  Obx(
                    () => SvgPicture.asset(Assets.icons.services.path,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          selectedPageIndex.value == 2
                              ? SolidColors.violetPrimery
                              : SolidColors.grey200,
                          BlendMode.srcIn,
                        )),
                  ),
                  Obx(() => Text(
                        MyStrings.services,
                        style: selectedPageIndex.value == 2
                            ? Theme.of(context).textTheme.labelSmall
                            : Theme.of(context).inputDecorationTheme.labelStyle,
                      ))
                ],
              ),
            ),
            InkWell(
              onTap: () => Obx(() => changeScreen(3)),
              child: Column(
                children: [
                  Obx(
                    () => SvgPicture.asset(Assets.icons.tasks.path,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          selectedPageIndex.value == 3
                              ? SolidColors.violetPrimery
                              : SolidColors.grey200,
                          BlendMode.srcIn,
                        )),
                  ),
                  Obx(() => Text(
                        MyStrings.tasks,
                        style: selectedPageIndex.value == 3
                            ? Theme.of(context).textTheme.labelSmall
                            : Theme.of(context).inputDecorationTheme.labelStyle,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
