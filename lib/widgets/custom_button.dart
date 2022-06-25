import 'package:anywash/constant/palette.dart';
import 'package:anywash/utils/color.dart';
import 'package:anywash/utils/keyboard-utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../core/enum/viewState.enum.dart';

class UiButton extends StatefulWidget {
  final String text;
  final Function? onPressed;
  final ViewState loadingState;

  const UiButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.loadingState = ViewState.idle,
  }) : super(key: key);

  @override
  _UiButtonState createState() => _UiButtonState();
}

class _UiButtonState extends State<UiButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        width: double.infinity,
        child: RaisedButton(
          elevation: 0,
          disabledColor: kMainColor.withOpacity(0.4),
          disabledTextColor: Colors.white.withOpacity(0.4),
          onPressed: (widget.loadingState == ViewState.idle)
              ? () {
                  killKeyboard(context);
                  widget.onPressed!();
                }
              : null,
          child: widget.loadingState == ViewState.idle
              ? Text(
                  widget.text,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                )
              : const SpinKitPulse(
                  color: Colors.white,
                  size: 16.0,
                ),
          color: primaryColor,
          textColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}

class UiButtonOutlined extends StatefulWidget {
  final String text;
  final Function onPressed;
  final ViewState loadingState;

  UiButtonOutlined({
    Key? key,
    required this.text,
    required this.onPressed,
    this.loadingState = ViewState.idle,
  }) : super(key: key);

  @override
  _UiButtonOutlinedState createState() => _UiButtonOutlinedState();
}

class _UiButtonOutlinedState extends State<UiButtonOutlined> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: greyBg,
          border: Border.all(color: border),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: RaisedButton(
        elevation: 0,
        disabledColor: Colors.transparent,
        onPressed: (widget.loadingState == ViewState.idle)
            ? () {
                killKeyboard(context);
                widget.onPressed();
              }
            : null,
        child: widget.loadingState == ViewState.idle
            ? Text(
                widget.text,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
              )
            : SpinKitPulse(
                color: kMainColor,
                size: 16.0,
              ),
        color: Colors.transparent,
        textColor: textDark,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
