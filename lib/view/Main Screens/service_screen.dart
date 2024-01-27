import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:we_wed/controller/service_controller.dart';
import 'package:we_wed/gen/assets.gen.dart';
import 'package:we_wed/utils/my_colors.dart';
import 'package:we_wed/utils/my_strings.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ServiceController serviceController = Get.put(ServiceController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    serviceController.fetchServices();
    return Scaffold(
      backgroundColor: Natural.paper,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Natural.white,
          foregroundColor: Natural.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.icons.bloomRight.path),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  MyStrings.servicesList,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              SvgPicture.asset(Assets.icons.bloomLeft.path),
            ],
          )),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Obx(() {
            if (serviceController.services.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Column(
                children: [
                  // DropdownButton<String>(
                  //   value: serviceController.selectedCity.value,
                  //   items: cities.map((city) {
                  //     return DropdownMenuItem<String>(
                  //       value: city,
                  //       child: Text(city),
                  //     );
                  //   }).toList(),
                  //   onChanged: (selectedCity) {
                  //     serviceController.setSelectedCity(selectedCity!);
                  //   },
                  // ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: width / 31.25, top: width / 120),
                    child: Container(
                      width: double.infinity,
                      height: height / 11.77,
                      decoration: BoxDecoration(
                        color: Natural.white,
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
                      child: Center(
                        child: Text(
                          MyStrings.comingSoon,
                          style:
                              Theme.of(context).snackBarTheme.contentTextStyle,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: serviceController.services.length,
                      itemBuilder: (context, index) {
                        final service = serviceController.services[index];
                        return Column(
                          children: [
                            Container(
                              height: height / 6,
                              decoration: BoxDecoration(
                                color: Natural.white,
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
                              child: Padding(
                                padding: EdgeInsets.all(width / 31.25),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: height / 8.12,
                                      width: width / 3.75,
                                      child: CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(service.image),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            service.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                size: 20,
                                                Icons.location_on_outlined,
                                                color: SolidColors.grey100,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                service.city,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.info_outline_rounded,
                                                color: SolidColors.grey100,
                                                size: 20,
                                              ),
                                              const SizedBox(width: 8),
                                              Expanded(
                                                child: Text(
                                                  service.address,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                  softWrap: true,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              const Icon(
                                                size: 20,
                                                Icons.phone_enabled_rounded,
                                                color: SolidColors.grey100,
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                service.phoneNumber,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                                softWrap: true,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: height / 10.5),
                ],
              );
            }
          }),
        ),
      ),
    );
  }
}
