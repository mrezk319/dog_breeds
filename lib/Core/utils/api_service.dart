import 'dart:developer';

import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://dog.ceo/api/";
  final Dio _dio;
  ApiService(this._dio);

  Future<Map<String, dynamic>> getData({required String endPoint}) async {
    log("$_baseUrl$endPoint");
    var response = await _dio.get("$_baseUrl$endPoint");
    return response.data;
  }
}
