import 'package:flutter/material.dart';

import 'package:fitness_app_uts/utils/colors.dart';
import 'package:fitness_app_uts/widgets/big_button.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';

class MainHome extends StatefulWidget {
  final String? finalRes;
  String? firstName;
  String? lastName;
  double? myBmi;
  MainHome({
    Key? key,
    this.finalRes,
    this.firstName,
    this.lastName,
    this.myBmi
  }) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    var flexWidth = MediaQuery.of(context).size.width;
    return Container(
      width: flexWidth,
      child: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            width: flexWidth - 60,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: AppColors.primaryColor),
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(
                        text: "BMI (Body Mass Index)",
                        textColor: AppColors.whiteColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      SmallText(
                        text: "You have a ${widget.myBmi!<=18.5?"underweight":widget.myBmi!<=25?"normal":widget.myBmi!<=30?"overweight":"obesity"} weight",
                        textColor: AppColors.whiteColor,
                        fontSize: 12,
                      ),
                      ButtonWidget(
                        text: "View More",
                        onPressed: () {},
                        width: 120,
                        gradColor: AppColors.secondaryColor,
                        fontSize: 14,
                        top: 0,
                        bottom: 0,
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Stack(clipBehavior: Clip.none, children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.blackColor.withOpacity(0.2),
                                blurRadius: 10,
                                spreadRadius: 1,
                                offset: const Offset(1, 2))
                          ]),
                    ),
                    Positioned(
                        top: -30,
                        left: 15,
                        child: Image.asset(
                          "assets/images/ellipse.png",
                          width: 120,
                          height: 120,
                        )),
                    Positioned(
                        top: 10,
                        left: 60,
                        child: SmallText(
                          text: "20.1",
                          textColor: AppColors.whiteColor,
                          fontSize: 15,
                        ))
                  ]),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: flexWidth - 60,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xff92A3FD).withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: "Today Target",
                  textColor: AppColors.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                ButtonWidget(
                  text: "Check",
                  onPressed: () {},
                  width: 100,
                  fontSize: 14,
                  height: 40,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            width: flexWidth - 60,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SmallText(
                text: "Activity Status",
                textColor: AppColors.blackColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(
                height: 15,
              ),
              Stack(children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  width: flexWidth - 60,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff92A3FD).withOpacity(0.4),
                  ),
                  child: Image.asset(
                    "assets/images/heart_graph.png",
                  ),
                ),
                Positioned(
                    left: 20,
                    top: 20,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(
                            text: "Heart Rate",
                            textColor: AppColors.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                          SmallText(
                            text: "78 BPM",
                            textColor: const Color.fromARGB(255, 101, 52, 236)
                                .withOpacity(0.5),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          )
                        ])),
                Positioned(
                  left: 170,
                  top: 25,
                  child: ButtonWidget(
                    onPressed: () {},
                    text: "3mins ago",
                    width: 100,
                    height: 40,
                    fontSize: 12,
                    gradColor: AppColors.secondaryColor,
                  ),
                )
              ])
            ]),
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 15),
            width: flexWidth - 60,
            height: 70,
            decoration: BoxDecoration(
              color: const Color(0xff92A3FD).withOpacity(0.4),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmallText(
                  text: "Show Workout Progress",
                  textColor: AppColors.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                    height: 60,
                    child: FittedBox(
                        fit: BoxFit.fill,
                        child: Switch(
                          thumbColor:
                              MaterialStateProperty.all(AppColors.whiteColor),
                          activeTrackColor: Colors.purple.withOpacity(0.4),
                          // trackColor: MaterialStateProperty.all(Colors.purple.withOpacity(0.4)),
                          value: isActive,
                          onChanged: (val) {
                            setState(() {
                              isActive = val;
                            });
                          },
                        )))
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          isActive
              ? Stack(children: [
                  Container(
                    width: flexWidth - 60,
                    height: 200,
                    child: Image.asset("assets/images/graph.png"),
                  )
                ])
              : const SizedBox()
        ],
      )),
    );
  }
}
