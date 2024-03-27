import 'package:flutter/material.dart';
import 'package:learletters/color.dart';
import 'package:learletters/components/custom_text.dart';
import 'package:learletters/main.dart';
import 'package:learletters/models/servece.dart';
import 'package:learletters/screens/challenge_screen1.dart';
import '../components/custom_progress_bar.dart';
import 'home_screen1.dart';

class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

int selecteIndex = 1;
double prograssCurentValue = 25;

class _LevelsScreenState extends State<LevelsScreen>
    with SingleTickerProviderStateMixin {
  int id = 1;
  double bottom = 90;
  double right = 250;
  int decrement = 0;
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    fetchLessonData();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 3), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
    if (selecteIndex == 2 || selecteIndex == 3 || selecteIndex == 4) {
      if (selecteIndex == 2) {
        bottom = bottom + 150;
        right = 140;
      }
      if (selecteIndex == 3) {
        bottom = 390;
        right = 250;
      }
      if (selecteIndex == 4) {
        bottom = 240;
        right = 140;
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Vector.png"),
                fit: BoxFit.fitWidth)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListView(
                reverse: true,
                itemExtent: 150,
                children: [
                  buttonLevel(1, "المرحلة الأولى"),
                  buttonLevel(2, "المرحلة الثانية"),
                  buttonLevel(3, "المرحلة الثالة"),
                  buttonLevel(4, "المرحلة الرابعة"),
                  buttonLevel(5, "المرحلة الخامسة"),
                  buttonLevel(6, "المرحلة السادسة"),
                  buttonLevel(7, "المرحلة السابعة"),
                  buttonLevel(8, "المرحلة الثامنة"),
                  buttonLevel(9, "المرحلة التاسعة"),
                  buttonLevel(10, "المرحلة العاشرة"),
                  buttonLevel(11, "المرحلة 11"),
                  buttonLevel(12, "المرحلة 12"),
                  buttonLevel(13, "المرحلة 13"),
                  buttonLevel(14, "المرحلة 14"),
                  buttonLevel(15, "المرحلة 15"),
                  buttonLevel(16, "المرحلة 16"),
                  buttonLevel(17, "المرحلة 17"),
                ],
              ),
            ),
            //-----------------------------------
            //custom prograss
            Positioned(
              height: 400,
              bottom: 190,
              left: MediaQuery.of(context).size.width / 30,
              child: CustomProgressBar(progress: prograssCurentValue),
            ),
            //------------------------------
            //massage top
            Positioned(
              left: 10,
              top: 90,
              child: customText(
                  "مرحبا بك ${sharedPreferences.getString("name")}",
                  txtColor: blueBorderColor),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width / 2.6,
              bottom: -20,
              left: MediaQuery.of(context).size.width / 3,
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(bottom: 30),
                decoration: BoxDecoration(
                  color: blueColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                        child:
                            bottomContainer("assets/images/Home.png", () {})),
                    Positioned(
                      left: 50,
                      child: bottomContainer("assets/images/Gift.png", () {}),
                    ),
                    Positioned(
                        left: 100,
                        child: bottomContainer(
                            "assets/images/Services.png", () {})),
                  ],
                ),
              ),
            ),
            //button navigate to chalange
            Positioned(
                bottom: 12,
                left: MediaQuery.of(context).size.width / 15,
                child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: blueColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: bottomContainer("assets/images/icon.png", () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => FirstChallengeScreen(),
                      ));
                    })))
          ],
        ),
      ),
    ));
  }

  //------------------------------------------------
//component bottom Icons
  Widget bottomContainer(String pathImage, void Function()? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: 45,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: progressBarColor,
        ),
        child: Image.asset(pathImage),
      ),
    );
  }

//-------------------------------------------------------
// component levels
  Widget buttonLevel(int index, String title) {
    print("hhhh");
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FirstHomeScreen(),
        ));
      },
      child: Stack(clipBehavior: Clip.none, children: [
        Positioned(
          right: index % 2 == 0 ? -80 : 30,
          child: Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 170, vertical: 20),
            decoration: BoxDecoration(
              border: Border.all(
                  color: selecteIndex >= index ? keywordLetterColor : blueColor,
                  width: 4),
              image: DecorationImage(
                image: selecteIndex >= index
                    ? const AssetImage("assets/images/leftstar.png")
                    : const AssetImage("assets/images/Vector2.png"),
              ),
              color: progressBarColor,
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        Positioned(
          right: index % 2 == 0 ? 10 : 120,
          child:
              customText(title, txtColor: lightBlackBorderColor, fontSizee: 18),
        ),
        Visibility(
          visible: index == 1 ? true : false,
          child: Positioned(
            right: id == 1 ? right : 60,
            bottom: id == 1 ? bottom : 60,
            child: GestureDetector(
              onVerticalDragDown: (details) {
                print(details);
              },
              child: SlideTransition(
                position: slidingAnimation,
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 70,
                  decoration: BoxDecoration(
                    color: blueColor,
                    border: Border.all(color: blackColor, width: 1),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      topRight: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                  ),
                  child: customText("ابدأ", fontSizee: 15),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
