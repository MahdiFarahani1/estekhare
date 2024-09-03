import 'dart:math';
import 'package:estekhare/Core/database/db_helper.dart';
import 'package:estekhare/Core/utils/loading.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static const String rn = "/home";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test"),
      ),
      body: FutureBuilder(
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
                  .data![Random().nextInt(snapshot.data!.length)]['ayaa'];
              return Center(
                child: Text(randomData),
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
    );
  }
}
