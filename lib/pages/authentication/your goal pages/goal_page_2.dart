import 'package:flutter/material.dart';
import 'package:fitness_app_uts/pages/authentication/your%20goal%20pages/goal_page_3.dart';
import 'package:fitness_app_uts/widgets/goal_widget.dart';

class GoalTwo extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  const GoalTwo({
    Key? key,
    this.firstName,
    this.lastName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoalWidget(
          imgUrl: "assets/images/vector2.png",
          subTopic: "Lean & Tone",
          expText: "I'm “skinny fat”. look thin but have\nno shape. I want to add learn\nmuscle in the right way",
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> GoalThree(firstName: firstName, lastName: lastName,)));
          },
        ),
      )
    );
  }
}
