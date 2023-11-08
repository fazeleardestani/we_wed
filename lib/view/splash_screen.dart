import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:we_wed/utils/my_colors.dart';
import '../gen/assets.gen.dart';
import 'package:get/get.dart';
import '../routes/names.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAndToNamed(NamedRoute.register);
      //TODO: condition for start
      // user.status==true ? Get.onAndToNamed(NamedRoute.mainscreen) : Get.onAndToNamed(NamedRoute.Register);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double hight = MediaQuery.of(context).size.height = 812
    //double width = MediaQuery.of(context).size.width = 375
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.images.wewedLogo.path),
              const SpinKitPumpingHeart(
                color: SolidColors.violetPrimery,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
