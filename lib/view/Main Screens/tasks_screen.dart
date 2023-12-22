import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:we_wed/gen/assets.gen.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

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
                  MyStrings.tasksList,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SvgPicture.asset(Assets.icons.bloomLeft.path),
            ],
          )),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height / 10),
        child: floatingButton(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      body: const SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Column(
              children: [Text("gbnlkmfgbpkixf")],
            ),
          ),
        ),
      ),
    );
  }

  FloatingActionButton floatingButton(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Natural.white,
      elevation: 4,
      onPressed: () {
        showModalBottomSheet(
            context: context,
            builder: (context) => Container(
                  decoration: const BoxDecoration(
                      color: Natural.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(32)),
                      border: Border.symmetric(
                          vertical: BorderSide(
                              width: 1, color: SolidColors.grey100))),
                child: Column(
                  children: [
                    
                  ],
                ),
                ));
      },
      label: Text(
        MyStrings.addNewTask,
        style: Theme.of(context).textTheme.headlineLarge,
      ),
      icon: const Icon(
        Icons.add,
        color: SolidColors.violetPrimery,
      ),
    );
  }
}
