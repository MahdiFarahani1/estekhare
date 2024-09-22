import 'package:estekhare/Core/utils/esay_size.dart';
import 'package:estekhare/Features/beforeStart/view/screens/start.dart';
import 'package:estekhare/gen/assets.gen.dart';
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
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: EsaySize.width(context),
          height: EsaySize.height(context),
          child: Assets.images.splash.image(fit: BoxFit.fill),
        ),
      ),
    );
  }
}
