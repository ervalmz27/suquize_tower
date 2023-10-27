// import 'dart:ui';

import 'package:tower_sequice/data/network/network_api_services.dart';
import 'package:tower_sequice/models/home/user_list_model.dart';
import 'package:tower_sequice/res/app_url/app_url.dart';

class ProfileRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> profileApi(var data) async {
    dynamic response = await _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }

  Future<UserListModel> getProfileApi() async {
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response.data);
  }

  Future<UserListModel> updateProfile(var data) async {
    dynamic response = await _apiService.patchApi(data, AppUrl.userListApi);
    return UserListModel.fromJson(response.data);
  }
}
