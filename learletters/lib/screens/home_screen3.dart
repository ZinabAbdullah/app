import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learletters/color.dart';
import 'package:learletters/screens/home_screen1.dart';
import '../../components/custom_button.dart';
import '../../components/custom_header.dart';
import '../components/custom_container_randomletter.dart';
import '../components/custom_lettercolumn.dart';
import '../components/custom_message.dart';
import '../components/custom_popup.dart';
import '../components/pop.dart';
import 'home_screen2.dart';
import 'intro_screen.dart';

class ThirdHomeScreen extends StatefulWidget {
  const ThirdHomeScreen({Key? key}) : super(key: key);

  @override
  _ThirdHomeScreenState createState() => _ThirdHomeScreenState();
}

class _ThirdHomeScreenState extends State<ThirdHomeScreen> {
  // bool _isPopupVisible = false;
  //
  // void _togglePopupVisibility() {
  //   setState(() {
  //     _isPopupVisible = !_isPopupVisible;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomHeader(
                  navigateTo: (context) => SecondHomeScreen(),
                ),
                SizedBox(
                  height: 15,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      "assets/images/rabbit.gif",
                    ),
                    Positioned(
                      top: 1,
                      right: -41,
                      child: Image.asset("assets/images/majed.png"),
                      height: 143,
                      width: 92,
                    ),
                    Positioned(
                      top: -30,
                      right: 40,
                      child: Container(
                        child: customMessage(" اكتب كلمة أرنب "),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomLetterColumn(text: ""),
                    CustomLetterColumn(text: "ر"),
                    CustomLetterColumn(text: "ن"),
                    CustomLetterColumn(text: "ب"),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomContainerRandomLetter(
                              letter: "خ",
                            ),
                            CustomContainerRandomLetter(
                              letter: "أ",
                            ),
                            CustomContainerRandomLetter(
                              letter: "ي",
                            ),
                            CustomContainerRandomLetter(
                              letter: "ر",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomContainerRandomLetter(
                              letter: "ن",
                            ),
                            CustomContainerRandomLetter(
                              letter: "ب",
                            ),
                            CustomContainerRandomLetter(
                              letter: "ث",
                            ),
                            CustomContainerRandomLetter(
                              letter: "ع",
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: lightBlueColor,
                  height: 68.38,
                  minWidth: 166.4,
                  onPressed: () {
                    showDialog(
                      barrierColor: popUpColor,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          shadowColor: pinkColor,
                          title: Stack(
                            children: [
                              Row(
                                children: [
                                  Image.asset("assets/images/leftstar.png"),
                                  Image.asset("assets/images/bigstar.png"),
                                  Image.asset("assets/images/rightstar.png"),
                                ],
                              ),
                            ],
                          ),
                          content: Container(
                            width: 266,
                            height: 235,
                            decoration: BoxDecoration(
                                color: popUpColor,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                      color: pinkColor, offset: Offset(0, 4)),
                                ]),
                            child: Column(
                              children: [
                                Text("عمل رائع"),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            Stack(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                              "assets/images/buttonbackground.png"),
                                          Image.asset(
                                              "assets/images/restar.png"),
                                        ],
                                        alignment: Alignment.center,
                                      ),
                                      onTap: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) =>
                                              FirstHomeScreen(),
                                        ));
                                      },
                                    ),
                                    GestureDetector(
                                      child: Stack(
                                        children: [
                                          Image.asset(
                                              "assets/images/buttonbackground.png"),
                                          Image.asset(
                                              "assets/images/forword.png"),
                                        ],
                                        alignment: Alignment.center,
                                      ),
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "التالي",
                    style: TextStyle(color: whiteColor, fontSize: 25, shadows: [
                      Shadow(
                          color: lightBlackBorderColor, offset: Offset(-1, 1))
                    ]),
                  ),
                ),
                // MaterialButton(
                //     child: Text("hhh"),
                //     onPressed: () {
                //       setState(() {
                //         PopupOverlayExample();
                //       });
                //     })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
