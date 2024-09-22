import 'package:estekhare/Core/utils/color.dart';
import 'package:estekhare/Core/utils/esay_size.dart';
import 'package:estekhare/Core/utils/widgets.dart';
import 'package:estekhare/Features/home/view/screen/home.dart';
import 'package:estekhare/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SecendPage extends StatelessWidget {
  static const rn = "/SecendPage";
  const SecendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bgWidget(
            context: context,
            child: Column(children: [
              // SizedBox(
              //   height: 200,
              //   width: EsaySize.width(context),
              //   child: Directionality(
              //     textDirection: TextDirection.rtl,
              //     child: Row(
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.all(12.0),
              //           child: Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Text(
              //                 "قراءة الدعاء المأثور",
              //                 style: TextStyle(
              //                     color: Colors.grey.shade800,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 30),
              //               ),
              //               Text(
              //                 "دعاء الاستخارة",
              //                 style: TextStyle(
              //                     color: Colors.green.shade400,
              //                     fontWeight: FontWeight.bold,
              //                     fontSize: 30),
              //               )
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  width: EsaySize.width(context) / 1.08,
                  height: EsaySize.height(context) / 1.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.images.shrine.path),
                          fit: BoxFit.contain)),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 60, right: 60, top: 145),
                    child: SingleChildScrollView(
                      child: Text(
                        "اللَّهُمَّ إنِّي أَسْتَخِيرُكَ بِعِلْمِكَ ، وَأَسْتَقْدِرُكَ بِقُدْرَتِكَ، وَأَسْأَلُكَ مِنْ فَضْلِكَ الْعَظِيمِ فَإِنَّكَ تَقْدِرُ وَلا أَقْدِرُ، وَتَعْلَمُ وَلا أَعْلَمُ، وَأَنْتَ عَلامُ الْغُيُوبِ، اللَّهُمَّ إنْ كُنْتَ تَعْلَمُ أَنَّ هَذَا الأَمْرَ (هنا تسمي حاجتك) خَيْرٌ لِي فِي دِينِي وَمَعَاشِي وَعَاقِبَةِ أَمْرِي وعَاجِلهِ وَآجِلِه، فَاقْدُرْهُ لِي وَيَسِّرْهُ لِي ثُمَّ بَارِكْ لِي فِيهِ، وَإِنْ كُنْتَ تَعْلَمُ أَنَّ هَذَا الأَمْرَ (هنا تسمي حاجتك) شَرٌّ لِي فِي دِينِي وَمَعَاشِي وَعَاقِبَةِ أَمْرِي وعَاجِلِه وَآجِلِهِ، فَاصْرِفْهُ عَنِّي وَاصْرِفْنِي عَنْهُ وَاقْدُرْ لِي الْخَيْرَ حَيْثُ كَانَ ثُمَّ ارْضِنِي بِه.",
                        style: TextStyle(
                          color: ColorApp.baseBackgroundColor,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                ),
              ),
              EsaySize.safeGap(50),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      transitionDuration: const Duration(milliseconds: 800),
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const HomePage(),
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
                  backgroundColor: ColorApp.baseButtonColor,
                  shadowColor: ColorApp.baseButtonColor,
                  elevation: 6,
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
            ])));
  }
}
