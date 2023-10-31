import 'dart:async';

import 'package:get/get.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';
import 'package:tower_sequice/view/first_screen.dart';
import 'package:tower_sequice/view/landing/landing_view.dart';
import 'package:tower_sequice/view/login/login_view.dart';
import 'package:tower_sequice/view/otp/otp_view.dart';
import 'package:tower_sequice/view/register/register_view.dart';
import 'package:tower_sequice/view_models/controller/user_preference/user_prefrence_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) {
      if (value.isLogin == false || value.isLogin.toString() == 'null') {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.splashScreen));
      } else {
        // Get.off(LoginView());
        // Get.off(OtpView());
        // Get.off(RegisterView());
        Get.off(LandingPage());
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.landingView));
      }
    });
  }
}
