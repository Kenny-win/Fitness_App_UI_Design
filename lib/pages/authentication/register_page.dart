import 'package:fitness_app_uts/pages/authentication/login_page.dart';
import 'package:fitness_app_uts/utils/colors.dart';
import 'package:fitness_app_uts/widgets/big_button.dart';
import 'package:fitness_app_uts/widgets/big_text.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';
import 'package:fitness_app_uts/widgets/textfield.dart';
import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var isCheck = false;
  bool isObscurePass = false;
  var ctr = 0;
  TextEditingController firstName = TextEditingController()..text = "";
  TextEditingController lastName = TextEditingController()..text = "";
  TextEditingController email = TextEditingController()..text = "";
  TextEditingController password = TextEditingController()..text = "";

  List fName = [];
  List lName = [];
  List userEmail = [];
  List userPass = [];

  void dispose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
              body: Container(
              width: double.infinity,
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            SmallText(
              text: "Hey There,",
              fontSize: 16,
            ),
            BigText(
              text: "Create an Account",
              fontSize: 20,
            ),
            const SizedBox(
              height: 30,
            ),
            TextFieldWidget(
              controller: firstName,
              text: "First Name",
              icon: const Icon(Icons.person_outline_rounded),
              isObscure: false,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFieldWidget(
              controller: lastName,
              text: "Last Name",
              icon: const Icon(Icons.person_outline_rounded),
              isObscure: false,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFieldWidget(
              controller: email,
              text: "Email",
              icon: const Icon(Icons.email_outlined),
              isObscure: false,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFieldWidget(
              controller: password,
              text: "Password",
              icon: const Icon(Icons.lock_outline_rounded),
              onPressed: () {
                setState(() {
                  isObscurePass = !isObscurePass;
                });
              },
              isObscure: isObscurePass ? false : true,
              suffixIcon: isObscurePass ? Icons.visibility_off : Icons.visibility,
            ),
            Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                width: double.infinity,
                child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Checkbox(
                    value: isCheck,
                    onChanged: (val) {
                      setState(() {
                        isCheck = !isCheck;
                      });
                    },
                  ),
                  SmallText(
                    text:
                        "By continuing you accept our Privacy Policy and \nTerm of Use",
                    fontSize: 12,
                    textColor: AppColors.greyColorMedium,
                  )
                ])),
            const SizedBox(
              height: 50,
            ),
            ButtonWidget(
              text: "Register",
              onPressed: () {
                var tmpFName = "";
                var tmpLName = "";
                setState(() {
                  if (firstName.text==""||lastName.text =="" || email.text =="" || password.text == "" || isCheck == false) _notAcceptPriPol();
                  else {
                    fName.add(firstName.text);
                    lName.add(lastName.text);
                    userEmail.add(email.text);
                    userPass.add(password.text);
                    tmpFName = fName[ctr];
                    tmpLName = lName[ctr];
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(emailList: userEmail, firstName: tmpFName, passwordList: userPass, lastName: tmpLName,)));
                    print("${fName[ctr]}, ${lName[ctr]}");
                    ctr += 1;
                  }
                  
                });
                // if (isCheck == true){
                //   Navigator.push(context, MaterialPageRoute(builder: (context)=> const CompleteProfilePage()));
                // } else{
                //   _notAcceptPriPol();
                // }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 60,
              child: Row(
                children: [
                  Expanded(
                      flex: 6,
                      child: Container(
                        color: AppColors.greyColorMedium,
                        height: 1,
                      )),
                  Expanded(
                    flex: 1,
                    child: SmallText(
                      text: "Or",
                      fontSize: 14,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Container(
                        color: AppColors.greyColorMedium,
                        height: 1,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Image.asset("assets/images/google.png"),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(width: 1, color: AppColors.greyColorLight)),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Image.asset("assets/images/facebook.png"),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border:
                          Border.all(width: 1, color: AppColors.greyColorLight)),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SmallText(
                text: "Already have an account?",
                fontSize: 12,
                textColor: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginPage()));
                },
                child: SmallText(
                  text: "Login",
                  fontSize: 12,
                  textColor: const Color.fromARGB(255, 225, 53, 244),
                ),
              )
            ])
          ],
              ),
            ))
        ));
  }

  _notAcceptPriPol() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('You Cannot Registering Your Account'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                      'Please fill the form above and accept our Privacy and Policy to registering your account!!'),
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
