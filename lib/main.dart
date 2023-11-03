
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:we_wed/themes/app_themes.dart';
import 'package:we_wed/utils/my_strings.dart';
import 'package:we_wed/route_manager/names.dart';
import 'package:we_wed/route_manager/pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemes.lightTheme,
      title: MyStrings.weWed,
      // locale: const Locale('fa'),
      textDirection: TextDirection.rtl,
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages,
      initialRoute: NamedRoute.initialRoute,
    );
  }
}