// import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:we_wed/controller/service_controller.dart';
import 'package:we_wed/gen/assets.gen.dart';
import 'package:we_wed/models/services_model.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';
import 'package:we_wed/widgets/custom_mask.dart.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ServiceController serviceController = Get.put(ServiceController());
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    serviceController.fetchServices();
    return Scaffold(
      backgroundColor: Natural.paper,
      appBar: AppBar(
        backgroundColor: Natural.white,
        centerTitle: true,
        title: Text(MyStrings.servicesList,
            style: Theme.of(context).textTheme.displayLarge),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Obx(() {
            if (serviceController.services.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: height / 11.77,
                    color: Natural.white,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: serviceController.services.length,
                      itemBuilder: (context, index) {
                        dynamic service = serviceController.services[index];
                        return Column(
                          children: [
                            Container(
                              height: height / 6.496,
                              decoration: BoxDecoration(
                                color: Natural.paper,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: const [
                                  BoxShadow(
                                    color: SolidColors.grey50,
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              // child: Text(service.name),
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      MaskedImage(
                                        imageUrl: service.image,
                                        imageLocalPath: Assets.images.blob.path,
                                      ),
                                      // SvgPicture.asset(
                                      //   Assets.images.blob.path,
                                      // ),
                                      // Image.network(
                                      //   service.image,
                                      //   colorBlendMode: BlendMode.srcIn,
                                      // )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: height / 10.5,
                  ),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
