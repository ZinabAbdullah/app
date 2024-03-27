import 'package:flutter/material.dart';
import 'package:learletters/color.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:learletters/components/custom_header.dart';
import '../../components/custom_button.dart';
import 'home_screen2.dart';

int star = 0;

class FirstHomeScreen extends StatefulWidget {
  const FirstHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _FirstHomeScreenState createState() => _FirstHomeScreenState();
}

class _FirstHomeScreenState extends State<FirstHomeScreen> {
  @override
  void initState() {
    //getletter();
    super.initState();
  }

  // final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  int click = 0;
  //
  // void dispose() {
  //   audioPlayer.dispose();
  //   super.dispose();
  // }

  int clickCount = 3;
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
                  navigateTo: (context) => SecondHomeScreen(),
                ),
                Image.asset("assets/images/ألف.png"),
                const SizedBox(
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
                          // clickCount == 3 || clickCount >= 1
                          //     ? "$clickCount"
                          //     : "",
                          "3",
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
                  onTap: () async {
                    setState(() {
                      click++;
                    });

                    final player = AudioPlayer();
                    if (isPlaying) {
                      await player.pause();
                    } else {
                      player.play(AssetSource('alph.mp3'));
                    }

                    if (clickCount == 3 || clickCount >= 1) {
                      clickCount--;
                    }
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
                click >= 3
                    ? CustomButton(
                        navigateTo: (context) {
                          return const SecondHomeScreen();
                        },
                        backgroundColor: lightBlueColor,
                        textBorderColor: lightBlackBorderColor,
                        title: 'التالي',
                      )
                    : CustomButton(
                        //navigateTo: (context) => const FirstHomeScreen(),
                        backgroundColor: lightBlueColor,
                        textBorderColor: lightBlackBorderColor,
                        title: 'التالي',
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
