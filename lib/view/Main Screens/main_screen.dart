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

class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 1.obs;
  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
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
            Positioned(
              child: Center(
                child: Obx(
                  () => IndexedStack(
                    index: selectedPageIndex.value,
                    children: const [
                      ProfileScreen(),
                      HomeScreen(),
                      ServiceScreen(),
                      TasksScreen()
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: BottomNavigation(
                    changeScreen: (int value) {
                      selectedPageIndex.value = value;
                      return value;
                    },
                    height: height,
                    selectedPageIndex: selectedPageIndex))
          ],
        ));
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.height,
    required this.changeScreen,
    required this.selectedPageIndex,
  });

  final double height;
  final Function(int value) changeScreen;
  final RxInt selectedPageIndex;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Stack(children: [
        SizedBox(
          height: height / 12.32,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => changeScreen(0),
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
              InkWell(
                onTap: () => changeScreen(1),
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
                              : Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle,
                        ))
                  ],
                ),
              ),
              InkWell(
                onTap: () => changeScreen(2),
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
                              : Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle,
                        ))
                  ],
                ),
              ),
              InkWell(
                onTap: () => changeScreen(3),
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
                              : Theme.of(context)
                                  .inputDecorationTheme
                                  .labelStyle,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}