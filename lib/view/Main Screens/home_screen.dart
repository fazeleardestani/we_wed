import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:we_wed/utils/my_colors.dart';

import '../../gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Natural.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.wewed.path,
              height: 28,
            ),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(child: Padding(
          padding: EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            children: [
              //TODO: text - hi - goto tasks screen
              //TODO: prograss bar
              //TODO: services
              //TODO: invite card
            ],
          ),
        )),
      ),
    );
  }
}
