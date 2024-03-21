import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:learletters/color.dart';
import 'package:learletters/models/servece.dart';
import 'package:learletters/screens/home_screen1.dart';
import '../../components/custom_header.dart';
import '../components/custom_lettercolumn.dart';
import '../components/custom_message.dart';
import 'home_screen2.dart';
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
  @override
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
                  navigateTo: (context) => const SecondHomeScreen(),
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
                        child: customMessage(" اكتب كلمة $Word "),
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
                      (index) => CustomLetterColumn(text: "${wordList[index]}"),
                    ),

                    // CustomLetterColumn(text: "ر"),
                    // CustomLetterColumn(text: "ن"),
                    // CustomLetterColumn(text: "ب"),
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
                  onPressed: () {},
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
