import 'package:flutter/material.dart';
import 'package:learletters/color.dart';

import '../../components/custom_button.dart';
import '../../components/custom_header.dart';
import 'home_screen2.dart';
import 'intro_screen.dart';

class FirstHomeScreen extends StatefulWidget {
  const FirstHomeScreen({Key? key}) : super(key: key);

  @override
  _FirstHomeScreenState createState() => _FirstHomeScreenState();
}

class _FirstHomeScreenState extends State<FirstHomeScreen> {
  int clickCount = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Stack(
                        children: [
                          Image.asset("assets/images/buttonbackground.png"),
                          Image.asset("assets/images/backword.png"),
                        ],
                        alignment: Alignment.center,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    GestureDetector(
                      child: Visibility(
                        visible: clickCount == 0 ? true : false,
                        child: Container(
                          height: clickCount < 1 ? 60 : 56,
                          width: clickCount < 1 ? 60 : 56,
                          decoration: BoxDecoration(
                            boxShadow: clickCount < 1
                                ? [
                                    BoxShadow(
                                      color: lightBlueColor,
                                      blurRadius: 10,
                                      // spreadRadius: 1,
                                    )
                                  ]
                                : [],
                          ),
                          child: Stack(
                            children: [
                              Image.asset("assets/images/buttonbackground.png"),
                              Image.asset("assets/images/forword.png"),
                            ],
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SecondHomeScreen(),
                        ));
                      },
                    ),
                  ],
                ),
                Image.asset("assets/images/ألف.png"),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    children: [
                      Positioned(
                        top: -25,
                        right: 5,
                        child: Text(
                          clickCount == 3 || clickCount >= 1
                              ? "$clickCount"
                              : "",
                          style: TextStyle(
                            fontSize: 40,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 2.0
                              ..color = lightBlueColor,
                          ),
                        ),
                      ),
                      Image.asset(
                        "assets/images/microphone.png",
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      if (clickCount == 3 || clickCount >= 1) {
                        clickCount--;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  navigateTo: (context) => SecondHomeScreen(),
                  backgroundColor: lightBlueColor,
                  textBorderColor: lightBlackBorderColor,
                  title: 'التالي',
                ),
                MaterialButton(onPressed: () {
                  setState(() {
                    if (clickCount <= 1)
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SecondHomeScreen(),
                      ));
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
