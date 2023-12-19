import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_wed/utils/my_strings.dart';
import 'package:we_wed/view/Main Screens/home_screen.dart';
import 'package:we_wed/view/Main Screens/profile_screen.dart';
import 'package:we_wed/view/Main Screens/service_screen.dart';
import 'package:we_wed/view/Main Screens/tasks_screen.dart';
import '../../gen/assets.gen.dart';
import '../../utils/my_colors.dart';

class MainScreen extends StatelessWidget {
  final RxInt selectedPageIndex = RxInt(1);

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Natural.paper,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: Obx(
              () => IndexedStack(
                index: selectedPageIndex.value,
                children: [
                  ProfileScreen(),
                  HomeScreen(),
                  ServiceScreen(),
                  TasksScreen(),
                ],
              ),
            ),
          ),
          BottomNavigation(
            height: height,
            width: width,
            changeScreen: (value) {
              selectedPageIndex.value = value;
            },
            selectedPageIndex: selectedPageIndex,
            key: const Key('bottom_navigation'),
          ),
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
  final Function(int) changeScreen;
  final RxInt selectedPageIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height / 12.32,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: height / 15.03,
            width: width / 6.94,
            child: GestureDetector(
              child: InkWell(
                autofocus: false,
                onTap: () => changeScreen(0),
                child: Column(
                  children: [
                    Obx(
                      () => SvgPicture.asset(
                        Assets.icons.profile.path,
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          selectedPageIndex.value == 0
                              ? SolidColors.violetPrimery
                              : SolidColors.grey200,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        MyStrings.profile,
                        style: selectedPageIndex.value == 0
                            ? Theme.of(context).textTheme.labelSmall
                            : Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            child: InkWell(
              onTap: () => changeScreen(1),
              child: Column(
                children: [
                  Obx(
                    () => SvgPicture.asset(
                      Assets.icons.home.path,
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        selectedPageIndex.value == 1
                            ? SolidColors.violetPrimery
                            : SolidColors.grey200,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      MyStrings.home,
                      style: selectedPageIndex.value == 1
                          ? Theme.of(context).textTheme.labelSmall
                          : Theme.of(context).inputDecorationTheme.labelStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: InkWell(
              onTap: () => changeScreen(2),
              child: Column(
                children: [
                  Obx(
                    () => SvgPicture.asset(
                      Assets.icons.services.path,
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        selectedPageIndex.value == 2
                            ? SolidColors.violetPrimery
                            : SolidColors.grey200,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      MyStrings.services,
                      style: selectedPageIndex.value == 2
                          ? Theme.of(context).textTheme.labelSmall
                          : Theme.of(context).inputDecorationTheme.labelStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            child: InkWell(
              onTap: () => changeScreen(3),
              child: Column(
                children: [
                  Obx(
                    () => SvgPicture.asset(
                      Assets.icons.tasks.path,
                      height: 24,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        selectedPageIndex.value == 3
                            ? SolidColors.violetPrimery
                            : SolidColors.grey200,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  Obx(
                    () => Text(
                      MyStrings.tasksList,
                      style: selectedPageIndex.value == 3
                          ? Theme.of(context).textTheme.labelSmall
                          : Theme.of(context).inputDecorationTheme.labelStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
