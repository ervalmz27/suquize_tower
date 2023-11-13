import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/res/routes/routes.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';
import 'package:upgrader/upgrader.dart';

void main() async {
  runApp(const MyApp());
  await Upgrader.clearSavedSettings();
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    if (Platform.isAndroid) {
      await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sequise Tower',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteName.fisrhScreen,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
