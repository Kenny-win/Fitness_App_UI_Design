import 'package:fitness_app_uts/widgets/big_text.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_uts/utils/colors.dart';
import 'package:fitness_app_uts/widgets/big_button.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';

class ProfilePage extends StatefulWidget {
  String? myHeight;
  String? myWeight;
  String? birthYear;
  String? gender;
  String? dateBirth;
  String? firstName;
  String? lastName;
  int? age;

  ProfilePage({
    Key? key,
    this.myHeight,
    this.myWeight,
    this.birthYear,
    this.gender,
    this.dateBirth,
    this.firstName,
    this.lastName,
    this.age,
  }) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    // int  age = int.parse(DateTime.now().toString().split("-")[0]) - int.parse(widget.birthYear);
    var flexWidth = MediaQuery.of(context).size.width;
    return Container(
      width: flexWidth,
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [Image.asset("assets/images/user.png", width: 50, height: 50,),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: "${widget.firstName} ${widget.lastName}",
                        textColor: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                      SmallText(
                        text: "VIP User",
                        textColor: AppColors.greyColorBold,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  )]
                )
              ),
              ButtonWidget(
                text: "Edit",
                onPressed: (){},
                width: 100,
                height: 40,
                fontSize: 14,
              )
            ],
          ),
          const SizedBox(height: 20,),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(
                        text: "${widget.myHeight}cm",
                        textColor: const Color.fromARGB(255, 90, 173, 255),
                        fontSize: 18,
                      ),
                      const SizedBox(height: 5,),
                      SmallText(
                        text: "Height",
                        textColor: AppColors.greyColorBold,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 40,
                        offset: const Offset(1,1)
                      )
                    ]
                  ),
                )
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(
                        text: "${widget.myWeight}kg",
                        textColor: const Color.fromARGB(255, 90, 173, 255),
                        fontSize: 18,
                      ),
                      const SizedBox(height: 5,),
                      SmallText(
                        text: "Weight",
                        textColor: AppColors.greyColorBold,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 40,
                        offset: const Offset(1,1)
                      )
                    ]
                  ),
                )
              ),
              const SizedBox(width: 10,),
              Expanded(
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SmallText(
                        text: "${widget.age} yo",
                        textColor: const Color.fromARGB(255, 90, 173, 255),
                        fontSize: 18,
                      ),
                      const SizedBox(height: 5,),
                      SmallText(
                        text: "Age",
                        textColor: AppColors.greyColorBold,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 40,
                        offset: const Offset(1,1)
                      )
                    ]
                  ),
                )
              ),
            ],
          ),
          const SizedBox(height: 20,),
          BigText(
            text: "Activity Progress",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          const SizedBox(height: 20,),
          Container(
            padding: const EdgeInsets.all(10),
            width: flexWidth - 60,
            height: 270,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.whiteColor,
                
                boxShadow: [
                  BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(1, 2))
                ]),
            child: Row(
              children: [
                const SizedBox(width: 5,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.greyColorLight.withOpacity(0.4),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          )
                        ),
                      ),
                      SmallText(text: "Sun")
                    ],
                  )
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.greyColorLight.withOpacity(0.4),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 170,
                            decoration: BoxDecoration(
                              gradient: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          )
                        ),
                      ),
                      SmallText(text: "Mon")
                    ],
                  )
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.greyColorLight.withOpacity(0.4),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 125,
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          )
                        ),
                      ),
                      SmallText(text: "Tue")
                    ],
                  )
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.greyColorLight.withOpacity(0.4),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 150,
                            decoration: BoxDecoration(
                              gradient: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          )
                        ),
                      ),
                      SmallText(text: "Wed")
                    ],
                  )
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.greyColorLight.withOpacity(0.4),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 185,
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          )
                        ),
                      ),
                      SmallText(text: "Thu")
                    ],
                  )
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.greyColorLight.withOpacity(0.4),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 80,
                            decoration: BoxDecoration(
                              gradient: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          )
                        ),
                      ),
                      SmallText(text: "Fri")
                    ],
                  )
                ),
                const SizedBox(width: 15,),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: AppColors.greyColorLight.withOpacity(0.4),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: 160,
                            decoration: BoxDecoration(
                              gradient: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(25),
                            ),
                          )
                        ),
                      ),
                      SmallText(text: "Sat"),
                    ],
                  )
                ),
                const SizedBox(width: 5,),
              ],
            ),
          )
        ],
      ),
    );
  }
}