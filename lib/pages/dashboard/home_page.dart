import 'package:fitness_app_uts/pages/dashboard/notification/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_uts/pages/dashboard/bottom_navbar_page/bmi_page.dart';
import 'package:fitness_app_uts/pages/dashboard/bottom_navbar_page/main_home.dart';
import 'package:fitness_app_uts/pages/dashboard/bottom_navbar_page/profile_page.dart';
import 'package:fitness_app_uts/utils/colors.dart';
import 'package:fitness_app_uts/widgets/big_text.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';

class HomePage extends StatefulWidget {
  // print("$myHeight $myWeight $birthYear $gender ${controller.text} ${widget.firstName} $bloodTp");
  String? myHeight;
  String? myWeight;
  String? birthYear;
  String? gender;
  String? dateBirth;
  String? firstName;
  String? lastName;
  String? bloodTp;
  int? age;

  HomePage(
      {Key? key,
      this.myHeight,
      this.myWeight,
      this.birthYear,
      this.gender,
      this.dateBirth,
      this.firstName,
      this.lastName,
      this.bloodTp,
      this.age})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List barSmallText = ["Welcome Back", "Calculate your", "This is your"];

  @override
  Widget build(BuildContext context) {
    double htgBMI = 0;
    var berat = int.parse(widget.myWeight!);
    var tinggi = int.parse(widget.myHeight!)/100;
    htgBMI = berat/(tinggi*tinggi);

    final List _myPage = [
      MainHome(myBmi: htgBMI,),
      const BmiPage(),
      ProfilePage(
        myHeight: widget.myHeight,
        myWeight: widget.myWeight,
        birthYear: widget.birthYear,
        gender: widget.gender,
        firstName: widget.firstName,
        lastName: widget.lastName,
        dateBirth: widget.dateBirth,
        age: widget.age,
      )
    ];
    // var flexWidth = MediaQuery.of(context).size.width;
    final List barBigText = [
      "${widget.firstName} ${widget.lastName}",
      "Body Mass Index",
      "User Profile"
    ];

    final List iconList = [
      Icons.notifications_on,
      Icons.history,
      Icons.more_horiz_rounded
    ];

    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
            child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: AppColors.whiteColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: Container(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SmallText(
                      text: barSmallText[_currentIndex],
                      fontSize: 12,
                      textColor: AppColors.greyColorMedium,
                    ),
                    BigText(
                      text: barBigText[_currentIndex],
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ],
                )),
            actions: [
              _currentIndex == 1||_currentIndex == 2
                  ? const SizedBox()
                  : IconButton(
                      onPressed: () {
                        _currentIndex == 0
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NotificationPage()))
                            : const SizedBox();
                      },
                      icon: Icon(
                        iconList[_currentIndex],
                        color: AppColors.blackColor,
                      ))
            ],
          ),
          body: _myPage[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            type: BottomNavigationBarType.fixed,
            onTap: (i) {
              setState(() {
                _currentIndex = i;
              });
            },
            iconSize: 30,
            showUnselectedLabels: false,
            currentIndex: _currentIndex,
            selectedItemColor: Colors.purple.withOpacity(0.5),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.monitor_weight,
                  ),
                  label: "BMI"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_rounded,
                  ),
                  label: "Profile"),
            ],
          ),
        )));
  }
}
