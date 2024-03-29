import 'package:get/get.dart';
import 'package:we_wed/routes/names.dart';
import 'package:we_wed/view/Main%20Screens/home_screen.dart';
import 'package:we_wed/view/Main%20Screens/main_screen.dart';
import 'package:we_wed/view/Main%20Screens/service_screen.dart';
import 'package:we_wed/view/Main%20Screens/tasks_screen.dart';
import 'package:we_wed/view/Starter Screens/date_picker_screen.dart';
import 'package:we_wed/view/Starter%20Screens/login_screen.dart';
import 'package:we_wed/view/Sub%20Screens/cost_manager_screen.dart';
import 'package:we_wed/view/Sub%20Screens/splash_screen.dart';
import '../view/Starter Screens/signup_screen.dart';
import '../view/Starter Screens/timeline_screen.dart';
// import '../view/splash_screen.dart';

class Pages {
  Pages._();

  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: NamedRoute.initialRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: NamedRoute.signUp,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: NamedRoute.signIn,
      page: () => LogInScreen(),
    ),
    GetPage(
      name: NamedRoute.pickDate,
      page: () => DatePickerScreen(),
    ),
    GetPage(
      name: NamedRoute.timeLine,
      page: () => TimeLineScreen(),
    ),
    GetPage(
      name: NamedRoute.mainScreen,
      page: () => MainScreen(),
    ),
    GetPage(
      name: NamedRoute.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: NamedRoute.servicesScreen,
      page: () => const ServiceScreen(),
    ),
    GetPage(
      name: NamedRoute.tasksScreen,
      page: () => const TasksScreen(),
    ),
    GetPage(
      name: NamedRoute.costManagerScreen,
      page: () => const CostManagerScreen(),
    ),
  ];
}
