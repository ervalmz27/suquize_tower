import 'dart:async';

import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';
import 'package:tower_sequice/view/landing/landing_view.dart';
import 'package:tower_sequice/view_models/controller/user_preference/user_prefrence_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  void isLogin() {
    userPreference.getUser().then((value) {
      String? token = value.token;
      DateTime expirationDate = JwtDecoder.getExpirationDate(token.toString());
      DateTime now = new DateTime.now();

      if (value.isLogin == false ||
          value.isLogin.toString() == 'null' ||
          now == expirationDate) {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.splashScreen));
      } else {
        Get.off(LandingPage());
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.landingView));
      }
    });
  }
}
