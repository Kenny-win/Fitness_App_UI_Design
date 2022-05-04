import 'package:fitness_app_uts/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  String text;
  Icon icon;
  TextEditingController? controller;
  double? width;
  IconData? suffixIcon;
  void Function()? onPressed;
  bool isObscure;

  TextFieldWidget(
      {Key? key, required this.text, required this.icon, this.controller, this.width=0, this.suffixIcon, this.onPressed, this.isObscure=true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width==0?MediaQuery.of(context).size.width - 60:width,
        decoration: BoxDecoration(
            color: AppColors.greyColorLight.withOpacity(0.4),
            borderRadius: BorderRadius.circular(20)),
        child: TextField(
          controller: controller,
          style: GoogleFonts.poppins(fontSize: 15),
          obscureText: isObscure,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: onPressed, 
              icon: Icon(suffixIcon)
            ),
              contentPadding: const EdgeInsets.only(top: 2, bottom: 2),
              prefixIcon: icon,
              labelText: text,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              enabledBorder: InputBorder.none),
        ));
  }
}
