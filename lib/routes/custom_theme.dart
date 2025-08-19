import 'package:flutter/material.dart';

class CustomThemes {
  static final ThemeData lightTheme = ThemeData(
    cardColor: Colors.white,
    fontFamily: "poppins",
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.grey.shade800,
    iconTheme: IconThemeData(color: Colors.grey.shade600),
  );
  static final ThemeData darkTheme = ThemeData(
    cardColor: Color(0xff57A0ED),
    fontFamily: "poppins",
    scaffoldBackgroundColor: Color(0xff57A0ED),
    primaryColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
  );
}
