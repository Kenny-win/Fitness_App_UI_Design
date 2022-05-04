import 'package:flutter/material.dart';
import 'package:fitness_app_uts/utils/colors.dart';
import 'package:fitness_app_uts/widgets/big_text.dart';
import 'package:fitness_app_uts/widgets/small_text.dart';

class NotificationPage extends StatefulWidget {
  bool? isTr;
  NotificationPage({
    Key? key,
    this.isTr,
  }) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isTap = false;
  bool boolean = false;
  var isDel = -1;
  var newIndex = 7;

  List image = [
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
    "assets/images/user.png",
  ];

  List mainChat = [
    "Hey, it's time for lunch, come on !!",
    "Let see your workout progress !!",
    "You get a discount meal",
    "Do you wanna hang out this afternoon?",
    "This is your last Chance with our program",
    "Come and fast booking fitness packages",
    "Ask your friend to join our app and get discount"
  ];

  List dateTime = [
    "About ${(int.parse(DateTime.now().toString().split(" ")[1].split(":")[1]) - 50).toString()} minutes ago",
    "About ${(int.parse(DateTime.now().toString().split(" ")[1].split(":")[1]) - 45).toString()} minutes ago",
    "About ${(int.parse(DateTime.now().toString().split(" ")[1].split(":")[1]) - 30).toString()} minutes ago",
    "About ${(int.parse(DateTime.now().toString().split(" ")[1].split(":")[1]) - 35).toString()} minutes ago",
    "About ${(int.parse(DateTime.now().toString().split(" ")[1].split(":")[1]) - 20).toString()} minutes ago",
    "About ${(int.parse(DateTime.now().toString().split(" ")[1].split(":")[1]) - 15).toString()} minutes ago",
    "About ${(int.parse(DateTime.now().toString().split(" ")[1].split(":")[1]) - 10).toString()} minutes ago",
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          elevation: 0,
          title: BigText(
            text: "Notification",
            textColor: AppColors.blackColor,
            fontSize: 20,
          ),
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
          leading: Container(
            decoration: BoxDecoration(
                color: AppColors.greyColorLight.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: AppColors.blackColor,
                size: 20,
              ),
              padding: const EdgeInsets.all(0),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isTap = !isTap;
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                  'Do you want to clear all notifications?'),
                              actions: <Widget>[
                                TextButton(
                                  child: const Text('Clear All'),
                                  onPressed: () {
                                    setState(() {
                                      image.clear();
                                      mainChat.clear();
                                      dateTime.clear();
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
                            ));
                     isTap = !isTap;
                  });
                },
                icon: Icon(
                  Icons.more_horiz_rounded,
                  color: AppColors.blackColor,
                ))
          ],
        ),
        body: SingleChildScrollView(
                child: Column(
                children: List.generate(
                    image.length,
                    (index) => ListTile(
                          leading: isDel == index
                              ? const SizedBox()
                              : Image.asset(
                                  image[index],
                                  width: 50,
                                  height: 50,
                                ),
                          title: SmallText(
                            text: isDel == index ? "" : mainChat[index],
                            fontSize: 14,
                            textColor: AppColors.blackColor,
                            fontWeight: FontWeight.w500,
                          ),
                          subtitle: SmallText(
                            text: dateTime[index],
                            fontSize: 12,
                          ),
                          trailing: isDel == index
                              ? const SizedBox()
                              : IconButton(
                                  icon: const Icon(Icons.more_vert_rounded),
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                              title: const Text(
                                                  'Do you want to remove this notifications?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('YES'),
                                                  onPressed: () {
                                                    setState(() {
                                                      image.removeAt(index);
                                                      mainChat.removeAt(index);
                                                      dateTime.removeAt(index);
                                                      // print(newIndex);
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
                                            ));
                                  },
                                ),
                        )),
              ))
            ,
      )
    );
  }
}
