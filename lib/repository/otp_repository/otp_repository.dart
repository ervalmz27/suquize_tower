// import 'dart:ui';

import 'package:tower_sequice/data/network/network_api_services.dart';
import 'package:tower_sequice/res/app_url/app_url.dart';

class OtpRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> otpApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.otpApi);
    return response;
  }

  Future<dynamic> resendOtpApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.resendOtpApi);
    return response;
  }
}
