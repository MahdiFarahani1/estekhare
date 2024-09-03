import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomLoading {
  static Widget loadCircle(BuildContext context) {
    return SpinKitRipple(
      itemBuilder: (context, index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Theme.of(context).primaryColor,
          ),
        );
      },
    );
  }

  static Widget loadLine(BuildContext context) {
    return SpinKitThreeInOut(
      size: 35,
      itemBuilder: (context, index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        );
      },
    );
  }

  static Widget fadingCircle(BuildContext context) {
    return SpinKitFadingCircle(
      size: 35,
      itemBuilder: (context, index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
          ),
        );
      },
    );
  }
}
