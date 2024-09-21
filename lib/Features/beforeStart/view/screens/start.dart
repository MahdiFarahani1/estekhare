import 'package:estekhare/Core/utils/color.dart';
import 'package:estekhare/Core/utils/esay_size.dart';
import 'package:estekhare/Core/utils/widgets.dart';
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
        body: bgWidget(
      context: context,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            EsaySize.gap(EsaySize.width(context) / 3),
            Container(
              width: EsaySize.width(context) / 1.4,
              height: EsaySize.height(context) / 2.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: ColorApp.baseCubeColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Assets.images.bookIcon.image(width: 65, height: 65),
                    EsaySize.gap(8),
                    const Text(
                      "التوجّه والنيّة إلى الله تعالى",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 800),
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      const SecendPage(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
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
                          backgroundColor: ColorApp.baseButtonColor,
                          elevation: 4,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        child: Shimmer.fromColors(
                          baseColor: Colors.black,
                          highlightColor: Colors.green,
                          direction: ShimmerDirection.rtl,
                          child: const Text(
                            "متابعة",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            EsaySize.safeGap(EsaySize.width(context) / 2),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, AboutUs.rn);
              },
              child: SizedBox(
                  width: 70, height: 70, child: Assets.images.about.image()),
            ),
          ],
        ),
      ),
    ));
  }
}
