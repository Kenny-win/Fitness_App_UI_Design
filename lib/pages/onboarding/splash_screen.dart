import 'package:fitness_app_uts/pages/onboarding/get_started_page.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_uts/utils/colors.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';
import 'dart:async';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({ Key? key }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const GetStartedPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: AppColors.primaryColor
        ),
        child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: "Fit",
                        style: GoogleFonts.poppins(
                          color: AppColors.blackColor,
                          fontSize: 34,
                          fontWeight: FontWeight.bold
                        ),
                        children: [
                          TextSpan(
                            text: "App",
                            style: GoogleFonts.poppins(
                              color: AppColors.whiteColor,
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                            )
                          )
                        ]
                      ),
                    ),
                    SmallText(text: "Everybody Can Train", fontSize: 18, textColor: Colors.white,)
                  ]
                )
              ),
      ),
    );
  }
}
