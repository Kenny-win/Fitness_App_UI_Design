import 'package:flutter/material.dart';

import 'package:fitness_app_uts/pages/authentication/your%20goal%20pages/goal_page_1.dart';
import 'package:fitness_app_uts/widgets/big_button.dart';
import 'package:fitness_app_uts/widgets/big_text.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';

class SuccessLoginPage extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  const SuccessLoginPage({
    Key? key,
    this.firstName,
    this.lastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 35,
              ),
              Image.asset(
                "assets/images/success_regis.png",
                width: 250,
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              BigText(
                text: "Welcome, $firstName",
                fontSize: 24,
              ),
              SmallText(
                text: "You are all set now, let's reach your\ngoals together with us",
                fontSize: 14,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 150,
              ),
              ButtonWidget(text: "Click Here", onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => GoalOne(firstName: firstName, lastName: lastName,)));
              })
            ],
          )
        ),
      )
    );
  }
}
