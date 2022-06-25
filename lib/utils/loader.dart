import 'package:anywash/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

showLoader(BuildContext context) {
  print(" loader: ${context.runtimeType}");
  Loader.show(context,
      progressIndicator: Center(
          child: SpinKitThreeBounce(
        color: kMainColor,
        size: 20.0,
      )));
}

hideLoader() {
  Loader.hide();
}
