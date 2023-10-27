// import 'dart:ui';

import 'package:tower_sequice/data/network/network_api_services.dart';
import 'package:tower_sequice/models/home/user_list_model.dart';
import 'package:tower_sequice/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<UserListModel> userListApi() async {
    dynamic response = await _apiService.getApi(AppUrl.userListApi);
    return UserListModel.fromJson(response.data);
  }
}
