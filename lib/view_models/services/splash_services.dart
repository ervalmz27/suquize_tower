import 'dart:async';
import 'dart:io';

import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';
import 'package:tower_sequice/view/landing/landing_view.dart';
import 'package:tower_sequice/view_models/controller/user_preference/user_prefrence_view_model.dart';
import 'package:upgrader/upgrader.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();

  Upgrader upgrader = Upgrader(
      shouldPopScope: () => false,
      canDismissDialog: false,
      durationUntilAlertAgain: const Duration(microseconds: 1),
      dialogStyle: Platform.isIOS
          ? UpgradeDialogStyle.cupertino
          : UpgradeDialogStyle.material,
      debugLogging: true);

  void isLogin() {
    userPreference.getUser().then((value) {
      String? token = value.token;
      if (token != null) {
        DateTime expirationDate =
            JwtDecoder.getExpirationDate(token.toString());
        DateTime now = DateTime.now();

        if (now.isAfter(expirationDate)) {
          Timer(const Duration(seconds: 3),
              () => Get.toNamed(RouteName.splashScreen));
        } else {
          Get.off(LandingPage());
          Timer(const Duration(seconds: 3),
              () => Get.toNamed(RouteName.landingView));
        }
      } else {
        Timer(const Duration(seconds: 3),
            () => Get.toNamed(RouteName.splashScreen));
      }
    });
  }
}
