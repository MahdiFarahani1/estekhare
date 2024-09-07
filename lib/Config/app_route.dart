import 'package:estekhare/Features/beforeStart/view/screens/secend.dart';
import 'package:estekhare/Features/beforeStart/view/screens/start.dart';
import 'package:estekhare/Features/home/view/screen/home.dart';
import 'package:estekhare/Features/home/view/screen/splash.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Map<String, Widget Function(BuildContext context)> routes() {
    return {
      Splash.rn: (context) => const Splash(),
      HomePage.rn: (context) => const HomePage(),
      StartPage.rn: (context) => const StartPage(),
      SecendPage.rn: (context) => const SecendPage(),
    };
  }
}
