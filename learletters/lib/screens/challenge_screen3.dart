import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:learletters/components/custom_dialog.dart';
import '../../color.dart';
import '../../components/custom_header.dart';
import '../../components/custom_progress_bar.dart';
import '../components/custom_lettercolumn.dart';
import '../components/custom_message.dart';
import '../main.dart';

class ThirdChallengeScreen extends StatefulWidget {
  const ThirdChallengeScreen({Key? key}) : super(key: key);

  @override
  _ThirdChallengeScreenState createState() => _ThirdChallengeScreenState();
}

class _ThirdChallengeScreenState extends State<ThirdChallengeScreen> {
  String letter = " ";
  int selectedletter = -1;

  List wordList = [];

  genLatterRandom(String target) {
    wordList = target.split('');
  }

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
    if (currentIndex < images.length) {
      setState(() {
        if (currentIndex == 1) {
          name = "بقرة";
          genLatterRandom(name);
        }
        if (currentIndex == 2) {
          name = "ثعلب";
          genLatterRandom(name);
        }
      });
    }
  }

  String name = "أرنب";
  @override
  void initState() {
    genLatterRandom(name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(wordList.length);
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
                height: 495,
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
                            Image.asset(
                                "${sharedPreferences.getString("image")}",
                                height: 188,
                                width: 121),
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
                            ...List.generate(
                              wordList.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: CustomLetterColumn(
                                    text: index == 0
                                        ? letter
                                        : "${wordList[index]}"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //
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
                                  letters[index],
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
                              setState(() {
                                if (letters[index] == wordList[0]) {
                                  letter = letters[index];
                                  final player = AudioPlayer();
                                  player.play(
                                    AssetSource('excellent.mp3'),
                                  );
                                } else {
                                  final player = AudioPlayer();
                                  player.play(
                                    AssetSource('retry.mp3'),
                                  );
                                  letter = "";
                                }
                              });
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
                  if (currentIndex > images.length - 2) {
                    showDialog(
                      barrierDismissible: false,
                      barrierColor: Colors.black45,
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialg();
                      },
                    );
                  } else {
                    setState(() {
                      currentIndex++;
                      letter = "";
                      wordList = [];
                      goToNextScreen();
                    });
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
