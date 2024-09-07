import 'package:estekhare/Core/utils/esay_size.dart';
import 'package:estekhare/Features/beforeStart/view/screens/about_us.dart';
import 'package:estekhare/Features/beforeStart/view/screens/secend.dart';
import 'package:estekhare/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class StartPage extends StatelessWidget {
  static const rn = "/startpage";
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: EsaySize.width(context),
        height: EsaySize.height(context),
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.white,
          Color.fromARGB(255, 215, 215, 215),
        ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                EsaySize.safeGap(EsaySize.height(context) / 8),
                Assets.images.bookIcon.image(width: 52, height: 52),
                Text(
                  "التوجّه والنيّة إلى الله تعالى",
                  style: TextStyle(
                      color: Colors.grey.shade800,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                EsaySize.safeGap(EsaySize.height(context) / 3),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 800),
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            const SecendPage(),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeTransition(
                            opacity: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(EsaySize.width(context) / 1.5, 42),
                      backgroundColor: Colors.grey,
                      elevation: 4,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(
                            color: Colors.white,
                          ))),
                  child: Shimmer.fromColors(
                    baseColor: Colors.white,
                    highlightColor: Colors.green,
                    direction: ShimmerDirection.rtl,
                    child: const Text(
                      "متابعة",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AboutUs.rn);
                  },
                  child: SizedBox(
                      width: 70,
                      height: 70,
                      child: Assets.images.about.image()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
