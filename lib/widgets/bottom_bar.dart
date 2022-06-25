import 'package:anywash/core/enum/viewState.enum.dart';
import 'package:anywash/utils/color.dart';
import 'package:anywash/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BottomBar extends StatelessWidget {
  final Function onTap;
  final String? text;
  final Color? color;
  final Color? textColor;
  final ViewState? view;

  BottomBar(
      {required this.onTap,
      required this.text,
      this.color,
      this.textColor,
      this.view = ViewState.idle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: view == ViewState.idle ? onTap as void Function()? : null,
      child: Container(
        child: Center(
          child: view == ViewState.idle
              ? Text(
                  text!,
                  style: textColor != null
                      ? bottomBarTextStyle.copyWith(color: textColor)
                      : bottomBarTextStyle,
                )
              : SpinKitThreeBounce(
                  color: Colors.white,
                  size: 20.0,
                ),
        ),
        color: color ?? primeryColor,
        height: 60.0,
      ),
    );
  }
}
