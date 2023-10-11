import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/models/login/user_model.dart';
import 'package:tower_sequice/repository/login_repository/login_repository.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';
import 'package:tower_sequice/utils/utils.dart';
import 'package:tower_sequice/view_models/controller/user_preference/user_prefrence_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;

      UserModel userModel = UserModel(token: value, isLogin: true);

      userPreference.saveUser(userModel).then((value) {
        Get.delete<LoginViewModel>();
        Get.toNamed(RouteName.homeView)!.then((value) {});
        Utils.snackBar('Login', 'Login successfully');
      }).onError((error, stackTrace) {});
    }).onError((error, stackTrace) {
      loading.value = false;
      print(error);
      Utils.snackBar('Error', error.toString());
    });
  }
}
