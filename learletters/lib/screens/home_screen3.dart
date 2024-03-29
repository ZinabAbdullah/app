import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learletters/color.dart';
import 'package:learletters/screens/home_screen1.dart';
import '../../components/custom_header.dart';
import '../components/custom_lettercolumn.dart';
import '../components/custom_message.dart';
import '../models/servece.dart';
import 'package:flutter/services.dart';
import 'levels_screen.dart';

class ThirdHomeScreen extends StatefulWidget {
  const ThirdHomeScreen({Key? key}) : super(key: key);

  @override
  _ThirdHomeScreenState createState() => _ThirdHomeScreenState();
}

class _ThirdHomeScreenState extends State<ThirdHomeScreen> {
  int selectedletter = 0;
  String letter = " ";
  List wordList = [];

  List genLatterRandom(String target) {
    wordList = target.split('');

    List allletters = [
      'أ',
      'ب',
      'ت',
      'ث',
      'ج',
      'ح',
      'خ',
      'د',
      'ذ',
      'ر',
      'ز',
      'س',
      'ش',
      'ص',
      'ض',
      'ط',
      'ظ',
      'ع',
      'غ',
      'ف',
      'ق',
      'ك',
      'ل',
      'م',
      'ن',
      'ه',
      'و',
      'ي',
      'ء',
    ];

    var randomlatter = [];
    for (var latter in target.characters) {
      if (!randomlatter.contains(latter)) {
        randomlatter.add(latter);
      }
    }
    while (randomlatter.length < 8) {
      var randomindex = Random().nextInt(allletters.length);
      var ralat = allletters[randomindex];
      if (!randomlatter.contains(ralat)) {
        randomlatter.add(ralat);
        print(randomlatter);
      }
    }
    randomlatter.shuffle();
    return randomlatter;
  }

  var result = [];

  void initState() {
    result = genLatterRandom(Word!);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 30,
              vertical: MediaQuery.of(context).size.height / 30,
            ),
            child: Column(
              children: [
                CustomHeader(
                  navigateTo: (context) => const LevelsScreen(),
                ),
                const SizedBox(
                  height: 15,
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      "assets/images/rabbit.gif",
                      width: 256,
                      height: 192,
                    ),
                    Positioned(
                      top: 1,
                      right: -41,
                      height: 143,
                      width: 92,
                      child: Image.asset("assets/images/majed.png"),
                    ),
                    Positioned(
                      top: -30,
                      right: 40,
                      child: Container(
                        child: customMessage(" اكتب كلمة $Word  "),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...List.generate(
                      wordList.length,
                      (index) => CustomLetterColumn(
                          text: index == 0 ? letter : "${wordList[index]}"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 220,
                    width: 270,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 30,
                          ),
                          itemCount: 8,
                          itemBuilder: ((context, index) {
                            return GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: lightBlueBorderColor)),
                                child: Text(
                                  "${result[index]}",
                                  style: const TextStyle(
                                      fontSize: 30,
                                      color: lightBlueBorderColor,
                                      fontFamily: "Monadi"),
                                ),
                              ),
                              onTap: () {
                                setState(() {
                                  selectedletter = index;
                                  letter = result[index];
                                });

                                if (letter == "أ") {
                                  final player = AudioPlayer();
                                  player.play(AssetSource('excellent.mp3'));
                                } else {
                                  final player = AudioPlayer();
                                  player.play(AssetSource('retry.mp3'));
                                }
                              },
                            );
                          })),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: lightBlueColor,
                  height: MediaQuery.of(context).size.height / 10.5,
                  minWidth: MediaQuery.of(context).size.width / 2.5,
                  onPressed: () {
                    if (letter != "أ") {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ThirdHomeScreen(),
                      ));
                    } else {
                      showDialog(
                        barrierDismissible: false,
                        barrierColor: Colors.black45,
                        context: context,
                        builder: (BuildContext context) {
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
                                        BoxShadow(
                                            color: pinkColor,
                                            offset: Offset(0, 4)),
                                      ]),
                                ),
                                Positioned(
                                    top: -160,
                                    right: 30,
                                    child:
                                        Image.asset("assets/images/light.png")),
                                Positioned(
                                    top: -30,
                                    right: 50,
                                    child: Image.asset(
                                        "assets/images/rightrectangle.png")),
                                Positioned(
                                    top: -30,
                                    left: 50,
                                    child: Image.asset(
                                        "assets/images/leftrectangle.png")),
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
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: pinkColor,
                                                offset: Offset(0, 4)),
                                          ]),
                                      child: const Padding(
                                        padding: EdgeInsets.only(top: 25.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "المرحلة الاولى",
                                              style: TextStyle(
                                                color: whiteColor,
                                                fontSize: 15,
                                                fontFamily: "Monadi",
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "اكتملت المرحلة",
                                              style: TextStyle(
                                                  color: whiteColor,
                                                  fontSize: 24,
                                                  decoration:
                                                      TextDecoration.none,
                                                  shadows: [
                                                    Shadow(
                                                        color: pinkColor,
                                                        offset: Offset(-1, 1))
                                                  ]),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                    //Image.asset("assets/images/rectangle.png")
                                    ),
                                Positioned(
                                  top: -112,
                                  right: 120,
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/leftstar.png"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset("assets/images/bigstar.png"),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Visibility(
                                          visible: letter == "أ" ? true : false,
                                          child: Image.asset(
                                              "assets/images/rightstar.png")),
                                    ],
                                  ),
                                ),
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
                                              fontFamily: "Monadi",
                                              fontSize: 32,
                                              color: lightBlueBorderColor,
                                              decoration: TextDecoration.none),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset(
                                                "assets/images/star.png"),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              "X10",
                                              style: TextStyle(
                                                color: pinkColor,
                                                fontSize: 24,
                                                decoration: TextDecoration.none,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/images/buttonbackground.png"),
                                            Image.asset(
                                                "assets/images/restart.png"),
                                          ],
                                        ),
                                        onTap: () {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const FirstHomeScreen(),
                                          ));
                                        },
                                      ),
                                      GestureDetector(
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Image.asset(
                                                "assets/images/buttonbackground.png"),
                                            Image.asset(
                                                "assets/images/forword.png"),
                                          ],
                                        ),
                                        onTap: () {
                                          selecteIndex = 2;
                                          prograssCurentValue = 50;

                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                const LevelsScreen(),
                                          ));
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    "التالي",
                    style: TextStyle(color: whiteColor, fontSize: 25, shadows: [
                      Shadow(
                          color: lightBlackBorderColor, offset: Offset(-1, 1))
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
