import 'package:anywash/utils/media.dart';
import 'package:flutter/material.dart';

class Customtextfild {
  static Widget textField(name1, textcolor, wi,
      {TextEditingController? controller,
      TextInputType? keyboardType,
      final ValueChanged<String>? onChanged}) {
    return Container(
      color: Colors.transparent,
      height: height / 20,
      width: wi,
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        onChanged: (v) => onChanged != null ? onChanged(v) : null,
        style: TextStyle(color: textcolor),
        decoration: InputDecoration(
          hintText: name1,
          hintStyle: const TextStyle(color: Colors.black87),
        ),
      ),
    );
  }
}
