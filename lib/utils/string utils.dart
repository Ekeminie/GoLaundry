import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';

copyToClipBoard(String data) {
  Clipboard.setData(ClipboardData(text: data));
  showToast("Copied to Clipboard");
}
