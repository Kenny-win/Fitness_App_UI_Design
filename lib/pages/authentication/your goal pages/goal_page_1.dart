import 'package:flutter/material.dart';
import 'package:fitness_app_uts/pages/authentication/your%20goal%20pages/goal_page_2.dart';
import 'package:fitness_app_uts/widgets/goal_widget.dart';

class GoalOne extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  const GoalOne({
    Key? key,
    this.firstName,
    this.lastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoalWidget(
          imgUrl: "assets/images/vector1.png",
          subTopic: "Improve Shape",
          expText: "I have a low amount of body fat\nand need / want to build more\nmuscle",
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> GoalTwo(firstName: firstName, lastName: lastName,)));
          },
        ),
      )
    );
  }
}
