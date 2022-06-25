import 'dart:io';

import 'package:intl/intl.dart';

const ext = 0;
final formatCurrency =
    NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'NGN');

//Formats the amount and returns a formatted amount
String formatPrice(String amount) {
  return formatCurrency.format(num.parse(amount)).toString();
}

extension StringCasingExtension on String {
  String? camelCaseChar() => toBeginningOfSentenceCase(this);
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

extension ImagePath on String {
  String get svg => 'image/new/$this.svg';
  String get png => 'image/new/$this.png';
  String get jpg => 'images/new/$this.jpg';
}

extension NumExtensions on int {
  double addPercentage(double v) => this + ((v / 100) * this);
  double getPercentage(double v) => ((v / 100) * this);
}

extension NumExtensionss on num {
  double addPercentage(double v) => this + ((v / 100) * this);
  double getPercentage(double v) => ((v / 100) * this);
}
