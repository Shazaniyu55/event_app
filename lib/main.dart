// ignore_for_file: unused_import

import 'package:event_app/screen/dashboard/settings.dart';
import 'package:event_app/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:event_app/controller/appController.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appController = Get.put(AppController());
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Event App',
        theme: ThemeData(
            primaryColor: const Color(0xff27C19F),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xff27C19F),
            )),
        builder: (context, child) {
          return ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        transitionDuration: const Duration(milliseconds: 500),
        defaultTransition: Transition.rightToLeftWithFade,
        home: const SplashScreen());
  }
}

class MyBehavior extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}



