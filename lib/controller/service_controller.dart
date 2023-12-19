import 'dart:developer';
import 'package:get/get.dart';
import 'package:we_wed/models/services_model.dart';
import 'package:we_wed/services/api_service.dart';

class ServiceController extends GetxController {
  List<dynamic> services = <dynamic>[].obs;

  void fetchServices() async {
    try {
      log(services.toString());
      List<dynamic> result = await ApiService.fetchServices();
      services.assignAll(result);
    } catch (error) {
      log("Error fetching services: $error");
    }
  }
}