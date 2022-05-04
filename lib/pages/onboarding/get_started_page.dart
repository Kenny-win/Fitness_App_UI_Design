import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app_uts/pages/authentication/register_page.dart';
import 'package:fitness_app_uts/utils/colors.dart';
import 'package:fitness_app_uts/widgets/big_text.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({Key? key}) : super(key: key);

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  var activeIndex = 0;
  List<String> imgUrl = [
    "assets/images/frame1.png",
    "assets/images/frame2.png",
    "assets/images/frame3.png",

  ];

  List<String> bigText = [
    "Track Your Goal",
    "Get Burn",
    "Eat Well",
  ];

  List<String> smallText = [
    "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
    "Let's keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
    "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) => Container(
                      // color: Colors.red,
                      child: Column(
                    children: [
                      Container(
                        height: index == 0? 375 : index == 2? 330 : 420,
                        width: double.infinity,
                        child: Image.asset(
                          imgUrl[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        // color: Colors.red,
                        padding: EdgeInsets.only(
                            left: 30,
                            right: 30,
                            top: index == 0
                                ? 65
                                : index == 2
                                    ? 100
                                    : 15,
                            bottom: 15), //15
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BigText(
                              text: bigText[index],
                              fontSize: 26,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SmallText(
                              text: smallText[index],
                              fontSize: 16,
                              textColor: AppColors.greyColorBold,
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              options: CarouselOptions(
                  height: 590,
                  viewportFraction: 1,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  onPageChanged: (index, reason) {
                    setState(() {
                      activeIndex = index;
                    });
                  })),
          Center(
            child: Container(
                width: 150,
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    gradient: AppColors.primaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 30,
                          offset: const Offset(1, 2))
                    ]),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterPage()));
                    },
                    child: Text(
                      "Get Started",
                      style: GoogleFonts.poppins(
                          fontSize: 15,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w500),
                    ))),
          ),
          const SizedBox(
            height: 8,
          ),
        ]),
      )
    );
  }
}
