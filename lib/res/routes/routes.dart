import 'package:get/get.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';
import 'package:tower_sequice/view/access/access_view.dart';
import 'package:tower_sequice/view/first_screen.dart';
import 'package:tower_sequice/view/profile/profile_view.dart';

import 'package:tower_sequice/view/landing/landing_view.dart';
import 'package:tower_sequice/view/login/login_view.dart';
import 'package:tower_sequice/view/otp/otp_view.dart';
import 'package:tower_sequice/view/register/register_view.dart';
import 'package:tower_sequice/view/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteName.fisrhScreen,
          page: () => const FirshScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.splashScreen,
          page: () => const IntroScreenDefault(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.loginView,
          page: () => const LoginView(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.otpView,
          page: () => const OtpView(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.downToUp,
        ),
        GetPage(
          name: RouteName.registerView,
          page: () => const RegisterView(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteName.landingView,
          page: () => LandingPage(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.profileView,
          page: () => const ProfileView(),
          transitionDuration: Duration(milliseconds: 100),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.accessView,
          page: () => const AccessView(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
      ];
}
