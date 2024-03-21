import 'package:flutter/material.dart';

import '../color.dart';
import '../screens/challenge_screen1.dart';
import '../screens/levels_screen.dart';

class CustomDialg extends StatelessWidget {
  const CustomDialg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Container(
            height: 235,
            width: 266,
            decoration: BoxDecoration(
                color: popUpColor,
                borderRadius: BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(color: pinkColor, offset: Offset(0, 4)),
                ]),
          ),
          Positioned(
              top: -160,
              right: 30,
              child: Image.asset("assets/images/light.png")),
          Positioned(
              top: -30,
              right: 50,
              child: Image.asset("assets/images/rightrectangle.png")),
          Positioned(
              top: -30,
              left: 50,
              child: Image.asset("assets/images/leftrectangle.png")),
          Positioned(
              top: -60,
              child: Container(
                width: 254.98,
                height: 96.33,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        popUpColor,
                        lightBlueBorderColor,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(color: pinkColor, offset: Offset(0, 4)),
                    ]),
                child: const Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Column(
                    children: [
                      Text(
                        "المرحلة الاولى",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: whiteColor,
                            fontSize: 15,
                            fontFamily: "Monadi"),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "لقد اكملت التحدي",
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            color: whiteColor,
                            fontSize: 24,
                            shadows: [
                              Shadow(color: pinkColor, offset: Offset(-1, 1))
                            ]),
                      )
                    ],
                  ),
                ),
              )
              //Image.asset("assets/images/rectangle.png")
              ),
          Positioned(
              top: -130,
              right: 160,
              child: Image.asset("assets/images/win.png")),
          Positioned(
            top: 60,
            right: 135,
            child: Container(
              // margin: EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  const Text(
                    "عمل رائع",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: "Monadi",
                      fontSize: 32,
                      color: lightBlueBorderColor,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/images/star.png"),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "X10",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: pinkColor,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 220),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/images/buttonbackground.png"),
                      Image.asset("assets/images/restart.png"),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FirstChallengeScreen(),
                    ));
                  },
                ),
                GestureDetector(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset("assets/images/buttonbackground.png"),
                      Image.asset("assets/images/forword.png"),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const LevelsScreen(),
                    ));
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
