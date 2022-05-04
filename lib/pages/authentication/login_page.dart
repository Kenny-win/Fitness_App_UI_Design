import 'package:fitness_app_uts/pages/authentication/register_page.dart';
import 'package:flutter/material.dart';

import 'package:fitness_app_uts/pages/authentication/success_login.dart';
import 'package:fitness_app_uts/utils/colors.dart';
import 'package:fitness_app_uts/widgets/big_button.dart';
import 'package:fitness_app_uts/widgets/big_text.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';
import 'package:fitness_app_uts/widgets/textfield.dart';

class LoginPage extends StatefulWidget {
  final String? firstName;
  final String? lastName;
  final List? emailList;
  final List? passwordList;

  const LoginPage({
    Key? key,
    this.firstName,
    this.lastName,
    this.emailList,
    this.passwordList,
  }) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isCheckLogin = false;
  bool isPressObscure = false;
  TextEditingController emailLogin = TextEditingController()..text = "";
  TextEditingController passLogin = TextEditingController()..text = "";

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
                text: "Welcome Back",
                fontSize: 20,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldWidget(
                isObscure: false,
                text: "Email",
                icon: Icon(Icons.email_outlined),
                controller: emailLogin,
              ),
              const SizedBox(
                height: 15,
              ),
              TextFieldWidget(
                controller: passLogin,
                text: "Password",
                icon: Icon(Icons.lock_outline_rounded),
                suffixIcon:
                    isPressObscure ? Icons.visibility_off : Icons.visibility,
                onPressed: () {
                  setState(() {
                    isPressObscure = !isPressObscure;
                  });
                },
                isObscure: isPressObscure ? false : true,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {},
                    child: SmallText(
                      text: "Forgot your password?",
                      fontSize: 12,
                      textColor: AppColors.greyColorMedium,
                      textDecoration: TextDecoration.underline,
                    ),
                  )),
              const SizedBox(
                height: 170,
              ),
              ButtonWidget(
                text: "Login",
                onPressed: () {
                  setState(() {
                    _authentication();
                  });
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
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 50,
                        height: 50,
                        child: Center(
                            child: Image.asset(
                          "assets/images/google.png",
                        )),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1, color: AppColors.greyColorLight)),
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 50,
                        height: 50,
                        child: Center(
                          child: Image.asset("assets/images/facebook.png"),
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 1, color: AppColors.greyColorLight)),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SmallText(
                  text: "Don't have an account yet?",
                  fontSize: 12,
                  textColor: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterPage()));
                  },
                  child: SmallText(
                    text: "Register",
                    fontSize: 12,
                    textColor: Color.fromARGB(255, 225, 53, 244),
                  ),
                )
              ])
            ],
          ),
              ),
            )
        ));
  }

  _authentication() {
    var listEmailNotNull = widget.emailList;
    var listPassNotNull = widget.passwordList;
    var isCorrect = false;

    if (listEmailNotNull != null && listPassNotNull != null) {
      var len1 = listEmailNotNull.length;
      for (int i = 0; i < len1; i++) {
        if (emailLogin.text == widget.emailList?[i] &&
            passLogin.text == widget.passwordList?[i]) {
          isCorrect = true;
        }
      }
    }
    return isCorrect == true && emailLogin.text != "" && passLogin.text != ""
        ? Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    SuccessLoginPage(firstName: widget.firstName, lastName: widget.lastName,)))
        : _showDialogError();
  }

  _showDialogError() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('You Cannot Login Your Account'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                      'You don\'t have account yet, please register your account!!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Register'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterPage()));
                },
              ),
            ],
          );
        });
  }
}
