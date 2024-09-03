import 'package:estekhare/Features/beforeStart/view/screens/start.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const String rn = "/";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacementNamed(context, StartPage.rn);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("splash"),
      ),
    );
  }
}
