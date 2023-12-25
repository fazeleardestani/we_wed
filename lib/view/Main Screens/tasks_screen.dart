import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:we_wed/controller/date_picker_controller.dart';
import 'package:we_wed/controller/tasks_controller.dart';
import 'package:we_wed/gen/assets.gen.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';
import '../../widgets/show_model_button_sheet.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});
  final TasksController controller = Get.put(TasksController());
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
                  MyStrings.tasksList,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SvgPicture.asset(Assets.icons.bloomLeft.path),
            ],
          )),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height / 10),
        child: floatingButton(context, height, width),
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

  FloatingActionButton floatingButton(BuildContext context, height, width) {
    return FloatingActionButton.extended(
      backgroundColor: Natural.white,
      elevation: 4,
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => ShowModalSheet(
                  dateController: dateController,
                  controller: controller,
                  height: height,
                  width: width,
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
