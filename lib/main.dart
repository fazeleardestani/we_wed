// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_wed/firebase_options.dart';
import 'package:we_wed/services/notification_service.dart';
import 'package:we_wed/themes/app_themes.dart';
import 'package:we_wed/utils/my_strings.dart';
import 'package:we_wed/routes/names.dart';
import 'package:we_wed/routes/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/timezone.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService().initNotification();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  tz.initializeTimeZones();
  final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
  tz.setLocalLocation(tz.getLocation(timeZoneName));

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemes.lightTheme,
      title: MyStrings.weWed,
      locale: const Locale('fa'),
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
      initialRoute: NamedRoute.initialRoute,
    );
  }
}
