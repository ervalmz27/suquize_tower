import 'package:tower_sequice/data/network/network_api_services.dart';
import 'package:tower_sequice/res/app_url/app_url.dart';

class RegisterRepository {
  final _apiService = NetworkApiServices();

  Future<dynamic> registerApi(var data) async {
    print(data);
    dynamic response = await _apiService.postApi(data, AppUrl.registerApi);
    return response;
  }
}
