// import 'dart:ui';

import 'package:tower_sequice/data/network/network_api_services.dart';
import 'package:tower_sequice/res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> loginApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }
}
