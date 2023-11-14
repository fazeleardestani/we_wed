import 'package:get/get.dart';
import 'package:we_wed/routes/names.dart';
import 'package:we_wed/view/Main%20Screens/home_screen.dart';
import 'package:we_wed/view/Main%20Screens/main_screen.dart';
import 'package:we_wed/view/Main%20Screens/profile_screen.dart';
import 'package:we_wed/view/Starter Screens/date_picker_screen.dart';
import 'package:we_wed/view/Starter Screens/login_screen.dart';
import 'package:we_wed/view/splash_screen.dart';
import '../view/Starter Screens/register_screen.dart';
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
      name: NamedRoute.register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: NamedRoute.login,
      page: () => LoginScreen(),
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
      page: () => const HomeScreen(),
    ),
  ];
}
