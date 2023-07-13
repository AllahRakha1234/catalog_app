import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.purple,
        appBarTheme: AppBarTheme(
          color: Colors.blue,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 26)
        ),
      textTheme: TextTheme(
          displayMedium: TextStyle(color: Colors.black)
      ),
    );
  }
    // COLORS
    static Color creamColor = Color(0xfff5f5f5);
    static Color darkBluishColor = Color(0xff403b58);
    static Color blackColor = Colors.black;
}
