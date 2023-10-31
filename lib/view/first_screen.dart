import 'package:flutter/material.dart';
import 'package:tower_sequice/view_models/services/splash_services.dart';

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
    splashScreen.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
    );
  }
}
