import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../color.dart';
import '../../components/custom_header.dart';
import '../../components/custom_progress_bar.dart';
import '../components/custom_message.dart';
import 'challenge_screen3.dart';

class SecondChallengeScreen extends StatefulWidget {
  const SecondChallengeScreen({Key? key}) : super(key: key);

  @override
  _SecondChallengeScreenState createState() => _SecondChallengeScreenState();
}

class _SecondChallengeScreenState extends State<SecondChallengeScreen> {
  List<String> letters = [
    "أ",
    "ب",
    "ت",
    "ث",
  ];

  List<String> letterc = [
    "أ",
    "ب",
    "ث",
  ];

  List<double> progressvalue = [
    50,
    60,
    70,
  ];

  int currentIndex = 0;

  void goToNextScreen() {
    if (currentIndex < letterc.length - 1) {
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
                navigateTo: (context) => const SecondChallengeScreen(),
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
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                customMessage(
                                  'يا صديقي هل بإمكانك ان تكتب هذا الحرف لي',
                                ),
                                Positioned(
                                  top: 90,
                                  right: 80,
                                  child: Text(
                                    letters[currentIndex],
                                    style: const TextStyle(
                                        fontSize: 40,
                                        color: pinkColor,
                                        fontFamily: "Monadi"),
                                  ),
                                )
                              ],
                            ),
                            Image.asset("assets/images/majed.png",
                                height: 188, width: 121),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
