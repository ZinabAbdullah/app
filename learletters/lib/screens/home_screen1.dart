import 'package:flutter/material.dart';
import 'package:learletters/color.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../components/custom_button.dart';
import '../components/custom_paint.dart';
import 'home_screen2.dart';
import 'package:dio/dio.dart';

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

  // var jsonList;
  // void getletter() async {
  //   final response =
  //       await Dio().get('https://jsonplaceholder.typicode.com/users');
  //   print(response.data[1]["id"]);
  // }
  //
  // @override
  // void setState(VoidCallback fn) {
  //   //jsonList response.
  //   super.setState(fn);
  // }

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/images/buttonbackground.png"),
                          Image.asset("assets/images/backword.png"),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    GestureDetector(
                      // child: Visibility(
                      //   visible: clickCount == 0 ? true : false,
                      //   child: Container(
                      //     height: clickCount < 1 ? 60 : 56,
                      //     width: clickCount < 1 ? 60 : 56,
                      //     decoration: BoxDecoration(
                      //       boxShadow: clickCount < 1
                      //           ? [
                      //               const BoxShadow(
                      //                 color: lightBlueColor,
                      //                 blurRadius: 10,
                      //                 // spreadRadius: 1,
                      //               )
                      //             ]
                      //           : [],
                      //     ),
                      //     child: Stack(
                      //       alignment: Alignment.center,
                      //       children: [
                      //         Image.asset("assets/images/buttonbackground.png"),
                      //         Image.asset("assets/images/forword.png"),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset("assets/images/buttonbackground.png"),
                          Image.asset("assets/images/forword.png"),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SecondHomeScreen(),
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
                  onTap: () async {
                    setState(() {
                      click++;
                      // final player = AudioPlayer();
                      // player.play(AssetSource('alph.mp3'));
                      // player.dispose();
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

                    // If file located in assets folder like assets/sounds/note01.wave"

                    // await player.play('assets/audioes/excellent.mp3');

                    // _audioPlayer.play('assets/audioes/excellent.mp3' as Source);
                  },
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButton(
                  navigateTo: (context) => const SecondHomeScreen(),
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
