import 'package:fitness_app_uts/pages/dashboard/bmi_history.dart/bmi_history_page.dart';
import 'package:fitness_app_uts/utils/colors.dart';
import 'package:fitness_app_uts/widgets/big_button.dart';
import 'package:fitness_app_uts/widgets/big_text.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiPage extends StatefulWidget {
  const BmiPage({Key? key}) : super(key: key);

  @override
  State<BmiPage> createState() => _BmiPageState();
}

class _BmiPageState extends State<BmiPage> {
  TextEditingController weight = TextEditingController()..text;
  TextEditingController height = TextEditingController()..text;
  double total = 0;
  String result = "";
  String error = "";
  List weightList = [];
  List heightList = [];
  List bmiList = [];
  List addHisTime = [];

  @override
  Widget build(BuildContext context) {
    var flexWidth = MediaQuery.of(context).size.width;
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigText(
                text: "BMI CALCULATOR",
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              const SizedBox(width: 40,),
              ButtonWidget(text: "See History", onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> BmiHistoryPage(weightList: weightList, heightList: heightList, bmiList: bmiList, addHisTime: addHisTime,)));
              }, width: 120, fontSize: 15, height: 40, gradColor: AppColors.secondaryColor,)
            ]
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: flexWidth - 60,
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      Color(0xffEEA4CE),
                      Color(0xffC58BF2),
                      Color(0xff9DCEFF),
                      Color(0xff92A3FD),
                    ]),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.blackColor.withOpacity(0.4),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: const Offset(1, 2))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: SmallText(
                    text: "RESULT",
                    fontSize: 35,
                    textColor: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  )
                ),
                Container(
                  height: 90,
                  padding: const EdgeInsets.all(0),
                  child: RichText(
                    text: TextSpan(
                        text: error!=""?error:total.toStringAsPrecision(3),
                        style: GoogleFonts.poppins(
                            fontSize: 70,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        children: [
                          TextSpan(
                              text: error!=""?"":" Kg/m2",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, color: AppColors.whiteColor))
                        ]),
                  )
                ),
                const SizedBox(height: 5,),
                SmallText(
                  text: error!=""?"":"Your BMI is $result",
                  fontSize: 18,
                  textColor: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              width: flexWidth - 60,
              height: 190,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                // gradient: AppColors.primaryColor
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        gradient: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.blackColor.withOpacity(0.4),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(1, 2))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SmallText(
                          text: "WEIGHT",
                          fontSize: 20,
                          textColor: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                        TextField(
                          maxLengthEnforcement: MaxLengthEnforcement.enforced,
                          maxLength: 3,
                          controller: weight,
                          cursorColor: AppColors.whiteColor,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 60, color: AppColors.whiteColor),
                          decoration: InputDecoration(
                            counterText: "",
                            suffixText: "Kg",
                            suffixStyle: TextStyle(
                              fontSize: 18,
                              color: AppColors.whiteColor
                            ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.whiteColor, width: 2)),
                              focusedBorder: InputBorder.none),
                        ),
                      ],
                    ),
                  )),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        gradient: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: AppColors.blackColor.withOpacity(0.4),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(1, 2))
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SmallText(
                          text: "HEIGHT",
                          fontSize: 20,
                          textColor: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                        TextField(
                          maxLength: 3,
                          controller: height,
                          cursorColor: AppColors.whiteColor,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 60, color: AppColors.whiteColor),
                          decoration: InputDecoration(
                            counterText: "",
                            suffixText: "cm",
                            suffixStyle: TextStyle(
                              fontSize: 18,
                              color: AppColors.whiteColor
                            ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.whiteColor, width: 2)),
                              focusedBorder: InputBorder.none),
                        )
                      ],
                    ),
                  ))
                ],
              )),
          Container(
              width: MediaQuery.of(context).size.width - 60,
              // height: height,
              padding: const EdgeInsets.only(
                top: 2,
                bottom: 2,
              ),
              decoration: BoxDecoration(
                  color: const Color(0xff92A3FD).withOpacity(0.8),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.blackColor.withOpacity(0.4),
                        spreadRadius: 1,
                        blurRadius: 30,
                        offset: const Offset(1, 2))
                  ]),
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      var hours = "";
                      var min = "";
                      error = "";
                      // print("${weight.text} and ${height.text}");
                      if (weight.text != "" && height.text != ""){
                        double cm = int.parse(height.text).toDouble()/100;
                        cm<0 || int.parse(weight.text)<0?error="ERROR":error="";
                        total = int.parse(weight.text)/(cm*cm);
                        int.parse(weight.text)<0||int.parse(height.text)<0||total<0?error="ERROR":total<=18.5?result="underweight":total<=25?result="normal":total<=30?result="overweight":result="obesity";
                        
                        if(int.parse(weight.text)>0&&int.parse(height.text)>0)
                        {
                          weightList.add(int.parse(weight.text));
                          heightList.add(int.parse(height.text));
                          bmiList.add(total.toStringAsFixed(2));
                          hours = (int.parse(DateTime.now().toString().split(".")[0].split(" ")[1].split(":")[0])-1).toString();
                          min = DateTime.now().toString().split(".")[0].split(" ")[1].split(":")[1];
                          addHisTime.add(DateTime.now().toString().split(".")[0].split(" ")[0]+"   "+hours+":"+min);
                        }
                        // print("ini adalah weekday : ${DateTime.now().weekday == DateTime.tuesday}");
                      }
                      else{
                        error = "ERROR";
                      }
                      
                      // print(DateTime.now());
                    });
                  },
                  child: Text(
                    "CALCULATE",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600),
                  )))
        ],
      ),
    );
  }
}
