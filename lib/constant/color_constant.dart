import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray = fromHex('#676767');
  static Color blue = Colors.blue;
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color bgColor = const Color.fromARGB(255, 232, 234, 237);
  
  //Color.fromARGB(255, 232, 234, 237),

// #0F73EE
  static Color primaryColor = fromHex('#0F73EE');
  static Color primaryColor2 = const Color.fromARGB(255, 230, 226, 226);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static const Color kWhite = Color(0xffFFFFFF);
  static const Color kRedColor = Color(0xffFF2526);
  static const Color kYellowColor = Color(0xffFFC03C);
  static const Color kBorderColor = Color(0xffDDDDDD);
}
