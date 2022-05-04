import 'package:fitness_app_uts/pages/dashboard/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fitness_app_uts/utils/colors.dart';
import 'package:fitness_app_uts/widgets/big_button.dart';
import 'package:fitness_app_uts/widgets/big_text.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';
import 'package:fitness_app_uts/widgets/textfield.dart';

class CompleteProfilePage extends StatefulWidget {
  final String? firstName;
  final String? height;
  final String? lastName;
  const CompleteProfilePage({
    Key? key,
    this.firstName,
    this.height,
    this.lastName,
  }) : super(key: key);

  @override
  State<CompleteProfilePage> createState() => _CompleteProfilePageState();
}

class _CompleteProfilePageState extends State<CompleteProfilePage> {
  TextEditingController controller = TextEditingController()..text = "";
  TextEditingController height = TextEditingController()..text = "";
  TextEditingController weight = TextEditingController()..text = "";

  final genders = ["Male", "Female"];
  final bloodType = ["A", "B", "AB", "O"];
  String? val;
  late DateTime _dateTime;
  int? _val = 1;
  String birthYear = "";
  String? gender = "";
  String myWeight = "";
  String myHeight = "";
  String bloodTp = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 250,
                  child: Image.asset(
                    "assets/images/comp_profile.png",
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                BigText(
                  text: "Let's complete your profile",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                SmallText(
                  text: "it will help us to know more about you!",
                  fontSize: 12,
                  textColor: AppColors.greyColorMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      child: Container(
                          // color: Colors.red,
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 10),
                                  width: MediaQuery.of(context).size.width - 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.greyColorLight
                                        .withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(children: [
                                    Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.person_outline_rounded,
                                        color: AppColors.greyColorBold,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Expanded(
                                        flex: 9,
                                        child: DropdownButtonHideUnderline(
                                            child: DropdownButton<String>(
                                                hint: const Text("Choose Gender"),
                                                isExpanded: true,
                                                value: val,
                                                items: genders
                                                    .map(buildMenuItem)
                                                    .toList(),
                                                onChanged: (val) {
                                                  setState(() {
                                                    this.val = val;
                                                    gender = val;
                                                  });
                                                })))
                                  ])),
                              const SizedBox(
                                height: 10,
                              ),
                              // Letakkan date picker disini...!!!,
                              Container(
                                  width: MediaQuery.of(context).size.width - 60,
                                  decoration: BoxDecoration(
                                      color: AppColors.greyColorLight
                                          .withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: TextField(
                                    controller: controller,
                                    style: GoogleFonts.poppins(fontSize: 15),
                                    decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(top: 2, bottom: 2),
                                        prefixIcon: IconButton(
                                            onPressed: () {
                                              showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime.now(),
                                                      firstDate: DateTime(1900),
                                                      lastDate: DateTime(2200))
                                                  .then((date) {
                                                _dateTime = date!;
                                                controller.text = _dateTime
                                                    .toString()
                                                    .split(" ")[0];
                                                birthYear = controller.text
                                                    .split("-")[0];
                                              });
                                            },
                                            icon: const Icon(Icons.calendar_month)),
                                        labelText: "Your Birthday (DDDD-MM-YY)",
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        enabledBorder: InputBorder.none),
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFieldWidget(
                                      controller: weight,
                                      isObscure: false,
                                      text: "Your Weight",
                                      icon: const Icon(Icons.monitor_weight_outlined),
                                      width: 285,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: 50,
                                      height: 50,
                                      child: Center(
                                        child: SmallText(
                                          text: "KG",
                                          textColor: AppColors.whiteColor,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          gradient: AppColors.secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.greyColorLight)),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextFieldWidget(
                                      isObscure: false,
                                      controller: height,
                                      text: "Your Height",
                                      icon: const Icon(Icons.height_outlined),
                                      width: 285,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      width: 50,
                                      height: 50,
                                      child: Center(
                                        child: SmallText(
                                          text: "CM",
                                          textColor: AppColors.whiteColor,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          gradient: AppColors.secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                              width: 1,
                                              color: AppColors.greyColorLight)),
                                    ),
                                  ]),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                  padding: const EdgeInsets.only(
                                      left: 35, right: 10),
                                  width: double.infinity,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SmallText(
                                          text: "Choose Your Blood Type",
                                          fontSize: 18,
                                          textColor: AppColors.blackColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Wrap(
                                          children: List<Widget>.generate(
                                            4,
                                            (int index) {
                                              return Container(
                                                  decoration:
                                                      BoxDecoration(boxShadow: [
                                                    _val == index
                                                        ? BoxShadow(
                                                            color: AppColors
                                                                .blackColor
                                                                .withOpacity(
                                                                    0.2),
                                                            spreadRadius: 1,
                                                            blurRadius: 15,
                                                            offset:
                                                                const Offset(1, 1))
                                                        : BoxShadow(
                                                            color: AppColors
                                                                .blackColor
                                                                .withOpacity(0),
                                                          )
                                                  ]),
                                                  margin: const EdgeInsets.only(
                                                      right: 8),
                                                  child: ChoiceChip(
                                                    label: Container(
                                                        width: 40,
                                                        height: 30,
                                                        child: Center(
                                                            child: SmallText(
                                                          text:
                                                              _val == index?bloodTp = bloodType[index]:bloodType[index],
                                                          textColor: _val ==
                                                                  index
                                                              ? AppColors
                                                                  .whiteColor
                                                              : AppColors
                                                                  .blackColor,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 20,
                                                        ))),
                                                    selected: _val == index,
                                                    selectedColor:
                                                        const Color.fromARGB(255, 233,
                                                                105, 255)
                                                            .withOpacity(0.6),
                                                    onSelected:
                                                        (bool selected) {
                                                      setState(() {
                                                        _val = selected
                                                            ? index
                                                            : null;
                                                      });
                                                    },
                                                  ));
                                            },
                                          ).toList(),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ]))
                            ],
                          ))),
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  text: "Done",
                  width: 300,
                  onPressed: () {
                    int age = 0;
                    myHeight = height.text;
                    myWeight = weight.text;
                    if (myHeight !="" && myWeight !="" && birthYear !="" && gender !="")
                    {
                      age = int.parse(DateTime.now().toString().split("-")[0])-int.parse(birthYear);
                      print(age);
                      print("$myHeight $myWeight $birthYear $gender ${controller.text} ${widget.firstName} $bloodTp");
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage(myHeight: myHeight, myWeight: myWeight, birthYear: birthYear, gender: gender, dateBirth: controller.text, firstName: widget.firstName, lastName: widget.lastName, age: age,)));
                    }
                    else{
                      _showDialogError();
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        )));
  }

  DropdownMenuItem<String> buildMenuItem(String gender) => DropdownMenuItem(
        value: gender,
        child: Text(gender, style: GoogleFonts.poppins(fontSize: 16)),
      );

  _showDialogError() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Profile Not Complete'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                      'Please complete all your profile !!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

