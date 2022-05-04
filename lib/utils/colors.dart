import 'package:flutter/material.dart';
// import 'dart:ui';

class AppColors {
  static Gradient primaryColor = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color(0xff9DCEFF),
        Color(0xff92A3FD),
      ]);

  static Gradient secondaryColor = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: <Color>[
        Color(0xffEEA4CE),
        Color(0xffC58BF2),
      ]);

  static Color blackColor = const Color(0xff1D1617);
  static Color whiteColor = const Color(0xffFFFFFF);
  static Color greyColorBold = const Color(0xff7B6F72);
  static Color greyColorMedium = const Color(0xffADA4A5);
  static Color greyColorLight = const Color(0xffDDDADA);
  static Color borderColor = const Color(0xffF7F8F8);
}
