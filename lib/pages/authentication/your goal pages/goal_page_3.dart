import 'package:flutter/material.dart';
import 'package:fitness_app_uts/pages/authentication/complete_profile.dart';
import 'package:fitness_app_uts/widgets/goal_widget.dart';

class GoalThree extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  const GoalThree({
    Key? key,
    this.firstName,
    this.lastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoalWidget(
          imgUrl: "assets/images/vector3.png",
          subTopic: "Lose a Fat",
          expText: "I have over 20 lbs to lose. I want to\ndrop all this fat and gain muscle\nmass",
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>  CompleteProfilePage(firstName: firstName, lastName: lastName,)));
          },
        ),
      )
    );
  }
}
