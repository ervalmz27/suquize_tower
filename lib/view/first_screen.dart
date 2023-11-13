import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tower_sequice/view/home/home_view.dart';
import 'package:tower_sequice/view_models/services/splash_services.dart';
import 'package:upgrader/upgrader.dart';

class FirshScreen extends StatefulWidget {
  const FirshScreen({super.key});

  @override
  State<FirshScreen> createState() => _FirshScreenState();
}

class _FirshScreenState extends State<FirshScreen> {
  SplashServices splashScreen = SplashServices();

  @override
  void initState() {
    super.initState();
    doSomeAsyncStuff();
  }

  Future<void> doSomeAsyncStuff() async {
    if (splashScreen.upgrader.isUpdateAvailable() == false) {
      splashScreen.isLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            // splashScreen.upgrader.isUpdateAvailable() == true
            //     ?
            UpgradeAlert(
      child: Container(
        color: Colors.cyan,
      ),
      upgrader: splashScreen.upgrader,
    ));
  }
}
