import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

Widget toast(String message, {bool? success}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          height: 50.0,
          color: !success! ? Colors.orangeAccent : Colors.greenAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Material(
                color: Colors.transparent,
                child: Text(
                  message.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

showCustomToast(String message, {bool success = false}) {
  showToastWidget(
    toast(message, success: success),
    duration: const Duration(seconds: 3),
    onDismiss: () {},
  );
}
