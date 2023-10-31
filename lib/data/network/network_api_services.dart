import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tower_sequice/data/network/base_api_services.dart';

import '../app_exceptions.dart';
import 'package:dio/dio.dart';

final dio = Dio();

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(
    String url,
  ) async {
    if (kDebugMode) {
      print(url);
    }

    dynamic responseJson;
    try {
      final prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('token');
      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.get(url);
      responseJson = response;
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    print(responseJson);
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    dynamic responseJson;

    try {
      final prefs = await SharedPreferences.getInstance();

      String? token = prefs.getString('token');

      dio.options.headers["Authorization"] = "Bearer $token";
      final response = await dio.post(url, data: data);

      responseJson = response;
      print(
        responseJson,
      );
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print('......');
      print(
        responseJson,
      );
    }
    return responseJson;
  }

  Future<dynamic> patchApi(var data, String url) async {
    dynamic responseJson;
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    dio.options.headers["Authorization"] = "Bearer $token";
    try {
      final response = await dio.patch(url, data: data);

      responseJson = response;
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print('......');
      print(
        responseJson,
      );
    }
    return responseJson;
  }

// JsonDecoder
  dynamic returnResponse(response) {
    switch (response) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      default:
        throw FetchDataException(
            'Error accoured while communicating with server ' +
                response.statusCode.toString());
    }
  }
}
