import 'dart:math';
import 'package:estekhare/Core/database/db_helper.dart';
import 'package:estekhare/Core/utils/color.dart';
import 'package:estekhare/Core/utils/esay_size.dart';
import 'package:estekhare/Core/utils/loading.dart';
import 'package:estekhare/Core/utils/widgets.dart';
import 'package:estekhare/Features/beforeStart/view/screens/start.dart';
import 'package:estekhare/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  static const String rn = "/home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String shareContent = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bgWidget(
        context: context,
        child: FutureBuilder(
          future: DBhelper().getAllData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CustomLoading.fadingCircle(context),
              );
            }

            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("An error occurred"),
                );
              }

              if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                final randomData =
                    snapshot.data![Random().nextInt(snapshot.data!.length)];
                shareContent = '''
                جواب الاستخارة: ${randomData['answer']}
                ملاحظات: ${randomData['description']}
                الآية: ${randomData['ayaa']}
                من سورة: ${randomData['soraa']}
                رقم الآية: ${randomData['ayaano']}
                رقم الصفحة: ${randomData['pnum']}
                    ''';
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      EsaySize.safeGap(20),
                      Container(
                        margin: const EdgeInsets.only(
                            top: 30, left: 16, right: 16, bottom: 8),
                        width: EsaySize.width(context),
                        height: EsaySize.height(context) / 5.5,
                        decoration: BoxDecoration(
                            color: ColorApp.baseCubeColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: boxTop(randomData: randomData),
                      ),
                      Container(
                        width: EsaySize.width(context),
                        height: 450,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.images.book.path),
                                fit: BoxFit.fill)),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 65),
                              child: Text(
                                randomData["soraa"],
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: Color(0xffB81736),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text(
                                "الآية:",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 16),
                              child: SizedBox(
                                width: EsaySize.width(context) / 2,
                                height: 200,
                                child: SingleChildScrollView(
                                  child: Text(
                                    randomData['ayaa'],
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.green.shade400,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 17, left: 10),
                              child: Text(
                                randomData["ayaano"].toString(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xffB81736),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, left: 6),
                              child: Text(
                                randomData["pnum"].toString(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color(0xffB81736),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(
                  child: Text("No data available"),
                );
              }
            }

            return const Center(
              child: Text("Something went wrong"),
            );
          },
        ),
      ),
    );
  }
}

class boxTop extends StatelessWidget {
  const boxTop({
    super.key,
    required this.randomData,
  });

  final Map<String, dynamic> randomData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EsaySize.safeGap(16),
        const Text(
          "جواب الاستخارة:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          randomData['answer'],
          style: const TextStyle(
            fontSize: 18,
            color: Color(0xffB81736),
          ),
        ),
        EsaySize.safeGap(16),
        const Text(
          "ملاحظات:",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Text(
            randomData['description'],
            style: const TextStyle(
              fontSize: 18,
              color: Color(0xffB81736),
            ),
          ),
        ),
      ],
    );
  }
}
