import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tower_sequice/models/login/index.dart';
import 'package:tower_sequice/repository/otp_repository/otp_repository.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';
import 'package:tower_sequice/utils/utils.dart';
import 'package:tower_sequice/view/landing/landing_view.dart';
import 'package:tower_sequice/view_models/controller/user_preference/user_prefrence_view_model.dart';

class OtpViewModel extends GetxController {
  UserPreference userPreference = UserPreference();

  final _api = OtpRepository();
  RxBool loading = false.obs;
  final prefs = SharedPreferences.getInstance();
  void otpApi(otp, value) {
    loading.value = true;
    Map data = {
      'email': value['email'],
      'otp': otp,
    };
    _api.otpApi(data).then((value) async {
      loading.value = false;

      UserModel userModel =
          UserModel(token: value.data['data']['token'], isLogin: true);
      userPreference.saveUser(userModel).then((value) {
        Get.delete<OtpViewModel>();
        Get.offAllNamed(RouteName.landingView);
        // Get.offAll(LandingPage());
        Utils.snackBar('Login', 'Login successfully');
      }).onError((error, stackTrace) {});
    }).catchError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.response.data['message']);
    });
  }

  void resendOtpApi(value) {
    Map data = {'email': value['email'], 'type': 'phone'};

    _api.resendOtpApi(data).then((value) {
      loading.value = false;
    }).catchError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar('Error', error.response.data['message']);
    });
  }
}
