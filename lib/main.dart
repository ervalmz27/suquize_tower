import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tower_sequice/res/routes/routes.dart';
import 'package:tower_sequice/res/routes/routes_name.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sequise Tower',
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteName.fisrhScreen,
      getPages: AppRoutes.appRoutes(),
    );
  }
}
