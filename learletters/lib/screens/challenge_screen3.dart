import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learletters/screens/challenge_screen1.dart';
import 'package:learletters/screens/levels_screen.dart';
import '../../color.dart';
import '../../components/custom_header.dart';
import '../../components/custom_progress_bar.dart';
import '../components/custom_lettercolumn.dart';
import '../components/custom_message.dart';

class ThirdChallengeScreen extends StatefulWidget {
  const ThirdChallengeScreen({Key? key}) : super(key: key);

  @override
  _ThirdChallengeScreenState createState() => _ThirdChallengeScreenState();
}

class _ThirdChallengeScreenState extends State<ThirdChallengeScreen> {
  String letter = " ";
  int selectedletter = -1;

  List<String> images = [
    "assets/images/rabbit.gif",
    "assets/images/cow.gif",
    "assets/images/fox.gif",
  ];

  List<String> letters = [
    "أ",
    "ب",
    "ت",
    "ث",
  ];

  List<double> progressvalue = [
    80,
    90,
    100,
  ];

  int currentIndex = 0;

  void goToNextScreen() {
    if (currentIndex < images.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      // Navigate to a different screen if needed
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ThirdChallengeScreen(),
        ),
      );
    }
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
                navigateTo: (context) => const ThirdChallengeScreen(),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 500,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomProgressBar(progress: progressvalue[currentIndex]),
                    Column(
                      children: [
                        Row(
                          children: [
                            customMessage(
                              'لقد فقدت احد احرف هذه الكلمة ساعدني في العثور عليه',
                            ),
                            Image.asset("assets/images/majed.png",
                                height: 188, width: 121),
                          ],
                        ),
                        Image.asset(
                          images[currentIndex],
                          width: 256,
                          height: 192,
                        ),
                        Row(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomLetterColumn(text: letter),
                            const SizedBox(
                              width: 30,
                            ),
                            CustomLetterColumn(text: "ر"),
                            const SizedBox(
                              width: 30,
                            ),
                            CustomLetterColumn(text: "ن"),
                            const SizedBox(
                              width: 30,
                            ),
                            CustomLetterColumn(text: "ب"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: SizedBox(
                    height: 60,
                    width: 300,
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 30,
                          );
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: letters.length,
                        itemBuilder: ((context, index) {
                          return GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: lightBlueBorderColor,
                                  borderRadius: BorderRadius.circular(10)),
                              height: 55,
                              width: 50,
                              child: Center(
                                child: Text(
                                  "${letters[index]}",
                                  style: const TextStyle(
                                      color: whiteColor,
                                      fontSize: 25,
                                      shadows: [
                                        Shadow(
                                            color: lightBlackBorderColor,
                                            offset: Offset(-1, 1))
                                      ]),
                                ),
                              ),
                            ),
                            onTap: () {
                              selectedletter = index;
                              if (selectedletter == currentIndex) {
                                final player = AudioPlayer();
                                player.play(AssetSource('excellent.mp3'));
                              }
                            },
                          );
                        })),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: lightBlueColor,
                height: MediaQuery.of(context).size.height / 10.5,
                minWidth: MediaQuery.of(context).size.width / 2.5,
                onPressed: () {
                  if (currentIndex > images.length - 2) {
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
                                        borderRadius: BorderRadius.circular(30),
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
                                              const FirstChallengeScreen(),
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
                  } else {
                    goToNextScreen();
                  }
                },
                child: const Text(
                  "التالي",
                  style: TextStyle(color: whiteColor, fontSize: 25, shadows: [
                    Shadow(color: lightBlackBorderColor, offset: Offset(-1, 1))
                  ]),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
