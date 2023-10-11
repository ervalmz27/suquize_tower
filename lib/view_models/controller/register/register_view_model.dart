import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/models/login/user_model.dart';
import 'package:tower_sequice/repository/register_repository/register_repository.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';
import 'package:tower_sequice/utils/utils.dart';
import 'package:tower_sequice/view_models/controller/user_preference/user_prefrence_view_model.dart';

class RegisterViewModel extends GetxController {
  final _api = RegisterRepository();

  UserPreference userPreference = UserPreference();

  final emailController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final tokenController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final phoneFocusNode = FocusNode().obs;
  final tokenFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void registerApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'nomor': phoneController.value.text,
      'token': tokenController.value.text
    };
    _api.registerApi(data).then((value) {
      loading.value = false;

      UserModel userModel = UserModel(token: value, isLogin: true);

      userPreference.saveUser(userModel).then((value) {
        Get.delete<RegisterViewModel>();
        Get.toNamed(RouteName.loginView)!.then((value) {});
        Utils.snackBar('Register', 'Register successfully');
      }).onError((error, stackTrace) {});
    }).onError((error, stackTrace) {
      loading.value = false;
      print(error);
      Utils.snackBar('Error', error.toString());
    });
  }
}
