import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:we_wed/models/services_model.dart';

class ApiService {
  static const String apiUrl = "http://138.201.210.10/api/testapi";

  static Future<List<ServiceModel>> fetchServices() async {
    final response = await http.post(Uri.parse(apiUrl));
    log(response.body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> servicesData = data['data'];
      List<ServiceModel> services = servicesData.map((json) => ServiceModel.fromJson(json)).toList();
      return services;
    } else {
      throw Exception("Failed to load services");
    }
  }
}
