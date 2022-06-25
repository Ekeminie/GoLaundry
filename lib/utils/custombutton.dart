import 'package:anywash/core/enum/viewState.enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'media.dart';

class Custombutton {
  static Widget button(clr, text, wi, {ViewState? viewState = ViewState.idle}) {
    return viewState == ViewState.idle
        ? Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                color: clr,
              ),
              height: height / 17,
              width: wi,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: height / 45,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        : const SpinKitThreeBounce(
            color: Colors.white,
            size: 20.0,
          );
  }
}
