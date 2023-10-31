import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/repository/login_repository/login_repository.dart';
import 'package:tower_sequice/utils/utils.dart';
import 'package:tower_sequice/view/login/login_view.dart';
import 'package:tower_sequice/view/otp/otp_view.dart';
import 'package:tower_sequice/view/register/register_view.dart';
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
      Get.delete<LoginViewModel>();
      Get.off(LoginView());

      Get.off(RegisterView());
      Get.to(() => const OtpView(), arguments: data)!.then((value) {});
      Utils.snackBar(
          'Success', 'try checking the message we sent to get the OTP!');
    }).onError((error, stackTrace) {
      loading.value = false;
      print(error);
      Utils.snackBar('Error', error.toString());
    });
  }
}
