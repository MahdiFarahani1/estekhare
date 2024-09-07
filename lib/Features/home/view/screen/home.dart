import 'dart:math';
import 'package:estekhare/Core/database/db_helper.dart';
import 'package:estekhare/Core/utils/esay_size.dart';
import 'package:estekhare/Core/utils/loading.dart';
import 'package:estekhare/Features/beforeStart/view/screens/start.dart';
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
      body: Stack(
        children: [
          Container(
            width: EsaySize.width(context),
            height: EsaySize.height(context),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xffB81736),
                Color(0xff281537),
              ]),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: EsaySize.width(context),
              height: EsaySize.height(context) - 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
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
                      final randomData = snapshot
                          .data![Random().nextInt(snapshot.data!.length)];
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
                            EsaySize.safeGap(16),
                            const Text(
                              "جواب الاستخارة:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
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
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                randomData['description'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Color(0xffB81736),
                                ),
                              ),
                            ),
                            EsaySize.safeGap(100),
                            const Text(
                              "الآية:",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                randomData['ayaa'],
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green.shade400,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            EsaySize.safeGap(100),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "من سورة:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                EsaySize.safeGap(8),
                                Text(
                                  randomData["soraa"],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffB81736),
                                  ),
                                )
                              ],
                            ),
                            EsaySize.safeGap(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "رقم الآية:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                EsaySize.safeGap(4),
                                Text(
                                  randomData["ayaano"].toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xffB81736),
                                  ),
                                )
                              ],
                            ),
                            EsaySize.safeGap(4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "رقم الصفحة:",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                EsaySize.safeGap(8),
                                Text(
                                  randomData["pnum"].toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Color(0xffB81736),
                                  ),
                                )
                              ],
                            )
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
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 35, right: 16),
              child: PopupMenuButton<String>(
                onSelected: (value) {
                  switch (value) {
                    case "0":
                      Navigator.pushReplacementNamed(context, StartPage.rn);
                      break;
                    case "1":
                      Share.share(shareContent);
                      break;
                    default:
                  }
                },
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      value: '0',
                      child: Row(
                        children: [
                          const Icon(Icons.home),
                          EsaySize.safeGap(6),
                          const Text("بيت")
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: '1',
                      child: Row(
                        children: [
                          const Icon(Icons.share),
                          EsaySize.safeGap(6),
                          const Text("مشاركة")
                        ],
                      ),
                    ),
                  ];
                },
                child: const Icon(
                  Icons.more_vert_sharp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
