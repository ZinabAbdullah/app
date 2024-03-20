import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learletters/components/custom_button.dart';
import '../../color.dart';
import '../../components/custom_header.dart';
import '../../components/custom_progress_bar.dart';
import '../components/custom_message.dart';
import 'challenge_screen2.dart';

class FirstChallengeScreen extends StatefulWidget {
  const FirstChallengeScreen({Key? key}) : super(key: key);

  @override
  _FirstChallengeScreenState createState() => _FirstChallengeScreenState();
}

class _FirstChallengeScreenState extends State<FirstChallengeScreen> {
  int currentIndex = 0;

  List<String> audio = [
    "assets/audioes/alph.mp3",
    "assets/audioes/alph.mp3",
    "assets/audioes/alph.mp3"
  ];

  void goToNextScreen() {
    if (currentIndex < audio.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      // Navigate to a different screen if needed
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SecondChallengeScreen(),
        ),
      );
    }
  }

  int selectedletter = -1;

  List<String> letters = [
    "أ",
    "ب",
    "ت",
    "ث",
  ];

  List<double> progressvalue = [
    20,
    30,
    40,
  ];
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
                navigateTo: (context) => const FirstChallengeScreen(),
              ),
              const SizedBox(
                height: 50,
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
                              'يا ترى ماهو شكل الحرف الذي تسمعه',
                            ),
                            Image.asset("assets/images/majed.png",
                                height: 188, width: 121),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.only(right: 100, top: 10),
                          child: Column(
                            children: [
                              GestureDetector(
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.topRight,
                                  children: [
                                    Positioned(
                                      top: -22,
                                      right: 20,
                                      child: Text(
                                        "3",
                                        style: TextStyle(
                                          fontSize: 50,
                                          foreground: Paint()
                                            ..style = PaintingStyle.stroke
                                            ..strokeWidth = 2.0
                                            ..color = lightBlueColor,
                                        ),
                                      ),
                                    ),
                                    Image.asset(
                                      "assets/images/bigmicrophonep.png",
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  final player = AudioPlayer();
                                  player.play(AssetSource(audio[currentIndex]));
                                },
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 45,
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
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Center(
                                          child: Text(
                                            "${letters[index]}",
                                            style: const TextStyle(
                                                color: whiteColor,
                                                fontSize: 25,
                                                shadows: [
                                                  Shadow(
                                                      color:
                                                          lightBlackBorderColor,
                                                      offset: Offset(-1, 1))
                                                ]),
                                          ),
                                        ),
                                        height: 55,
                                        width: 50,
                                      ),
                                      onTap: () {
                                        selectedletter = index;
                                        if (selectedletter == currentIndex) {
                                          final player = AudioPlayer();
                                          player.play(AssetSource(
                                              'assets/audioes/alph.mp3'));
                                        }
                                      },
                                    );
                                  })),
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   height: 60,
                        //   child: ListView.builder(
                        //       scrollDirection: Axis.horizontal,
                        //       itemCount: letters.length,
                        //       itemBuilder: ((context, index) {
                        //         return GestureDetector(
                        //           child: Container(
                        //             decoration: BoxDecoration(
                        //                 color: lightBlueBorderColor,
                        //                 borderRadius:
                        //                     BorderRadius.circular(10)),
                        //             child: Center(
                        //               child: Text(
                        //                 "$letters[index]",
                        //                 style: TextStyle(
                        //                     color: whiteColor,
                        //                     fontSize: 25,
                        //                     shadows: [
                        //                       Shadow(
                        //                           color: lightBlackBorderColor,
                        //                           offset: Offset(-1, 1))
                        //                     ]),
                        //               ),
                        //             ),
                        //             height: 55,
                        //             width: 50,
                        //           ),
                        //           onTap: () {
                        //             selectedletter = index;
                        //           },
                        //         );
                        //       })),
                        // )
                        // Row(
                        //   children: [
                        //     Container(
                        //       decoration: BoxDecoration(
                        //           color: lightBlueBorderColor,
                        //           borderRadius: BorderRadius.circular(10)),
                        //       child: Center(
                        //         child: Text(
                        //           "أ",
                        //           style: TextStyle(
                        //               color: whiteColor,
                        //               fontSize: 25,
                        //               shadows: [
                        //                 Shadow(
                        //                     color: lightBlackBorderColor,
                        //                     offset: Offset(-1, 1))
                        //               ]),
                        //         ),
                        //       ),
                        //       height: 55,
                        //       width: 50,
                        //     )
                        //   ],
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              // CustomButton(
              //     navigateTo: (context) => SecondChallengeScreen(),
              //     backgroundColor: lightBlueColor,
              //     textBorderColor: lightBlackBorderColor,
              //     title: "التالي")

              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: lightBlueColor,
                // height: 68.38,
                // minWidth: 166.4,
                height: MediaQuery.of(context).size.height / 10.5,
                minWidth: MediaQuery.of(context).size.width / 2.5,
                onPressed: () {
                  goToNextScreen();
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
