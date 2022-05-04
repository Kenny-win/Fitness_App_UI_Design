import 'package:fitness_app_uts/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:fitness_app_uts/utils/colors.dart';

class ButtonWidget extends StatelessWidget {
  String text;
  void Function() onPressed;
  double? width;
  Gradient? gradColor;
  double? fontSize;
  double top;
  double bottom;
  double left;
  double right;
  double? height;

  ButtonWidget(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.width = 0,
      this.bottom = 2,
      this.top = 2,
      this.left = 0,
      this.right = 0,
      this.fontSize,
      this.height,
      this.gradColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width == 0 ? MediaQuery.of(context).size.width - 60 : width,
        height: height,
        padding: EdgeInsets.only(
            top: top == 0 ? top = 2 : top,
            bottom: bottom == 0 ? bottom = 2 : bottom,
          ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: gradColor == null ? AppColors.primaryColor : gradColor,
            boxShadow: [
              BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 30,
                  offset: const Offset(1, 2))
            ]),
        child: TextButton(
            onPressed: onPressed,
            child: Text(
              text,
              style: GoogleFonts.poppins(
                  fontSize: fontSize == null ? fontSize = 20 : fontSize,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600),
            )));
  }
}
