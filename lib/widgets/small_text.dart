import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  String text;
  Color? textColor;
  double? fontSize;
  FontWeight? fontWeight;
  TextAlign? textAlign;
  TextDecoration? textDecoration;

  SmallText(
      {Key? key,
      required this.text,
      this.textColor,
      this.fontSize = 14,
      this.fontWeight,
      this.textDecoration,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: textColor,
          fontSize: fontSize == 0 ? fontSize = 14 : fontSize,
          fontWeight: fontWeight,
          decoration: textDecoration
          ),
      textAlign: textAlign,
    );
  }
}
