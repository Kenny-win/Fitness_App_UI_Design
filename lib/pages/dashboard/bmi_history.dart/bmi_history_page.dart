import 'package:flutter/material.dart';
import 'package:fitness_app_uts/utils/colors.dart';
import 'package:fitness_app_uts/widgets/big_text.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';

class BmiHistoryPage extends StatefulWidget {
  final List? weightList;
  final List? heightList;
  final List? bmiList;
  final List? addHisTime;
  const BmiHistoryPage({
    Key? key,
    this.weightList,
    this.heightList,
    this.bmiList,
    this.addHisTime,
  }) : super(key: key);

  @override
  State<BmiHistoryPage> createState() => _BmiHistoryPageState();
}

class _BmiHistoryPageState extends State<BmiHistoryPage> {
  bool isTap = false;
  bool boolean = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          elevation: 0,
          title: BigText(text: "My BMI History", textColor: AppColors.blackColor, fontSize: 20, fontWeight: FontWeight.w500,),
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
          leading: Container(
            decoration: BoxDecoration(
              color: AppColors.greyColorLight.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10)
            ),
            child: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back_ios, color: AppColors.blackColor, size: 20,),
              padding: const EdgeInsets.all(0),
            ),
          ),
          actions: [
            IconButton(onPressed: (){
                setState(() {
                 isTap = !isTap;
                  showDialog(context: context, builder: (context)=>
                      AlertDialog(
                        title: const Text('Do you want to clear all BMI history?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Clear All'),
                            onPressed: () {
                              setState(() {
                                boolean = true;
                                widget.weightList!.clear();
                                widget.heightList!.clear();
                                widget.addHisTime!.clear();
                                widget.bmiList!.clear();
                                Navigator.of(context).pop();
                              });
                            },
                          ),
                          TextButton(
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      )
                    );
              isTap = !isTap;
            });
            }, icon: Icon(Icons.more_horiz_rounded, color: AppColors.blackColor,))
          ],
        ),
        body:boolean==false? SingleChildScrollView(
          child: Column(children: List.generate(widget.weightList!.length, (index) =>
            ListTile(
              leading: Image.asset(boolean==false?"assets/images/user.png":"", width: 50, height: 50,),
              title: SmallText(
                text: "Width : ${widget.weightList![index]} kg, Height : ${widget.heightList![index]} cm\nBMI => ${widget.bmiList![index]} kg/m2",
                fontSize: 14,
                textColor: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
              subtitle: SmallText(
                text: widget.addHisTime![index],
                fontSize: 12,
              ), 
              trailing: IconButton(icon: const Icon(Icons.more_vert_rounded), onPressed: (){
                showDialog(context: context, builder: (context)=>
                      AlertDialog(
                        title: const Text('Do you want to remove this history?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('YES'),
                            onPressed: () {
                              setState(() {
                                widget.weightList!.removeAt(index);
                                widget.heightList!.removeAt(index);
                                widget.addHisTime!.removeAt(index);
                                widget.bmiList!.removeAt(index);
                                Navigator.of(context).pop();
                              });
                            },
                          ),
                          TextButton(
                            child: const Text('NO'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      )
                    );
              },),
            )),
            )
        ): const SizedBox()
        )
    );
  }
}