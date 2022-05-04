import 'package:fitness_app_uts/utils/colors.dart';
import 'package:fitness_app_uts/widgets/big_button.dart';
import 'package:fitness_app_uts/widgets/big_text.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';
import 'package:flutter/material.dart';

class GoalWidget extends StatelessWidget {
  String imgUrl;
  String subTopic;
  String expText;
  void Function() onPressed;

  GoalWidget({
    Key? key,
    required this.imgUrl,
    required this.subTopic,
    required this.expText,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          BigText(
            text: "What is your goal ?",
            fontSize: 24,
          ),
          SmallText(
            text: "it will help us to choose a best\nprogram for you",
            fontSize: 14,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 159, 110, 243).withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
              Container(
                width: 275,
                height: 440,
                decoration: BoxDecoration(
                    gradient: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: 175,
                      height: 275,
                      child: Image.asset(
                        imgUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SmallText(
                      text: subTopic,
                      textColor: AppColors.whiteColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    Container(
                      width: 45,
                      height: 1,
                      color: AppColors.whiteColor,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SmallText(
                      text:
                          expText,
                      fontSize: 12,
                      textAlign: TextAlign.center,
                      textColor: AppColors.whiteColor,
                    )
                  ],
                ),
              ),
              Container(
                width: 40,
                height: 350,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 119, 222, 248).withOpacity(0.3),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ButtonWidget(
            text: "Confirm",
            onPressed: onPressed,
            width: 300,
          )
        ],
      );
  }
}
