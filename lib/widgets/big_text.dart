import 'package:fitness_app_uts/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class BigText extends StatelessWidget {
  String text;
  Color? textColor = AppColors.blackColor;
  double? fontSize;
  FontWeight fontWeight;

  BigText({
    Key? key,
    required this.text,
    this.textColor,
    this.fontSize = 36,
    this.fontWeight = FontWeight.bold
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: GoogleFonts.poppins(
        color: textColor,
        fontSize: fontSize,
        fontWeight: fontWeight
      ),
    );
  }
}
