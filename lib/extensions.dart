import 'package:flutter/material.dart';

extension MySize on int {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());

  SizedBox heights(BuildContext context) =>
      SizedBox(height: MediaQuery.sizeOf(context).height * this / 100);

  SizedBox widths(BuildContext context) =>
      SizedBox(width: MediaQuery.sizeOf(context).width * this / 100);
}

extension StringExt on String {
  bool get isValidEmail =>
      RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(this);

  bool get isValidPassword =>
      RegExp(r'[a-zA-Z0-9!@#$%^&*()]{8}').hasMatch(this);
}
