import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/data/response/status.dart';
import 'package:tower_sequice/repository/profile_repository/profile.repository.dart';
import 'package:tower_sequice/utils/utils.dart';
import 'package:tower_sequice/view_models/controller/user_preference/user_prefrence_view_model.dart';

class ProfileViewModel extends GetxController {
  final _api = ProfileRepository();
  UserPreference userPreference = UserPreference();
  final rxRequestStatus = Status.LOADING.obs;

  final emailController = TextEditingController().obs;
  final mobilePhoneController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final mobilePhoneFocusNode = FocusNode().obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  RxBool loading = false.obs;

  void updateProfile() {
    loading.value = true;
    Map data = {
      'mobilePhone': emailController.value.text,
    };
    _api.profileApi(data).then((value) {
      loading.value = false;

      Utils.snackBar(
          'Success', 'try checking the message we sent to get the OTP!');
    }).onError((error, stackTrace) {
      loading.value = false;
      print(error);
      Utils.snackBar('Error', error.toString());
    });
  }

  void getProfile() {
    setRxRequestStatus(Status.LOADING);

    _api.getProfileApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      mobilePhoneController.value.text = "62" + value.data!['mobilePhone'];
      ;
      print(value.data!['email']);
    }).onError((error, stackTrace) {
      loading.value = false;
      print('erroor');
      print(error);
      setRxRequestStatus(Status.ERROR);

      Utils.snackBar('Error', error.toString());
    });
  }
}