abstract class BaseApiServices {
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(dynamic data, String url);
  Future<dynamic> patchApi(dynamic data, String url);
}
