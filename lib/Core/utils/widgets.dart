import 'package:estekhare/Core/utils/color.dart';
import 'package:estekhare/Core/utils/esay_size.dart';
import 'package:estekhare/gen/assets.gen.dart';
import 'package:flutter/material.dart';

Widget bgWidget({required BuildContext context, required Widget child}) {
  return SafeArea(
      child: Container(
    width: EsaySize.width(context),
    height: EsaySize.height(context),
    decoration: BoxDecoration(
      image: DecorationImage(
          image: AssetImage(
            Assets.images.background.path,
          ),
          fit: BoxFit.fill),
    ),
    child: child,
  ));
}

Widget btn({required VoidCallback onPressed, required IconData icon}) {
  return InkWell(
      onTap: () {
        onPressed();
      },
      child: Card(
        elevation: 6.5,
        shadowColor: ColorApp.baseButtonColor,
        color: ColorApp.baseButtonColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
        ),
      ));
}
