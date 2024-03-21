import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:learletters/components/custom_button.dart';
import 'package:learletters/main.dart';
import 'package:learletters/models/level_model.dart';
import 'package:learletters/screens/levels_screen.dart';
import '../components/custom_clipper.dart';
import '../components/custom_text.dart';
import '../color.dart';
import '../models/level_model.dart';

class ScreenChoose extends StatefulWidget {
  const ScreenChoose({super.key});

  @override
  State<ScreenChoose> createState() => _ScreenChooseState();
}

class _ScreenChooseState extends State<ScreenChoose> {
  LevelModel levelModel = LevelModel();

  fetchUserData(String pName, String gender) async {
    var url = Uri.parse(
        "https://coderteam.net/api/auth/login?username='$pName'&current_level=1&current_lesson=1&score=4&level_id=1&gender=$gender");

    var result = await post(url);
    var respone = jsonDecode(result.body);
    levelModel.accessToken = respone["accessToken"];
    levelModel.message = respone["message"];
  }

  @override
  void initState() {
    fetchUserData(perconalName, gender);

    super.initState();
  }

  String perconalName = "حنين";
  String gender = "female";
  Color hanenColor = pinkColor;
  Color hanenColorBorder = pinkColor;
  Color hanenColorContainer = pinkColor;
  Color majedColor = whiteColor.withOpacity(0.3);
  Color majedColorBorder = blueColor.withOpacity(0.3);
  Color majedColorContainer = blueColor.withOpacity(0.1);
  bool visabil = true;
  double heightHanen = 310;
  double widthHanen = 310;
  double heightMaged = 300;
  double widthMaged = 300;
  String pathImage = "assets/images/haneen.png";
  Color btnColor = pinkColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 20,
        vertical: MediaQuery.of(context).size.height / 10,
      ),
      child: ListView(
        children: [
          customText("اختر شخصيتك", txtColor: btnColor),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          pathImage = "assets/images/haneen.png";
                          hanenColorContainer = pinkColor;
                          majedColorContainer =
                              majedColorContainer.withOpacity(0.1);
                          majedColorBorder = majedColorBorder.withOpacity(0.3);
                          visabil = true;
                          heightMaged = 300;
                          widthMaged = 300;
                          heightHanen = 310;
                          widthHanen = 310;
                          btnColor = pinkColor;
                          perconalName = "حنين";
                          gender = "female";
                          sharedPreferences.setString("name", perconalName);
                          sharedPreferences.setString("image", pathImage);
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: widthHanen,
                        height: heightHanen,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: hanenColorBorder, width: 6),
                            color: hanenColorContainer,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16))),
                        child: Stack(
                          children: [
                            Positioned(
                              child: Visibility(
                                visible: visabil == true ? true : false,
                                child: Image.asset(
                                  "assets/images/haneen.png",
                                  color: null,
                                  height: 180,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 40,
                              right: 80,
                              child: Visibility(
                                  visible: visabil == true ? true : false,
                                  child: customText("حنين")),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Transform.rotate(
                    angle: pi,
                    child: ClipPath(
                      clipper: MyCustomClipper(),
                      child: InkWell(
                        onTap: () {
                          {
                            setState(() {
                              perconalName = "ماجد";
                              gender = "male";
                              pathImage = "assets/images/majed.png";
                              hanenColorContainer =
                                  hanenColorContainer.withOpacity(0.1);
                              majedColorContainer = blueColor;
                              majedColorBorder = blueBorderColor;
                              visabil = false;
                              heightHanen = 300;
                              widthHanen = 300;
                              heightMaged = 310;
                              widthMaged = 310;
                              btnColor = blueBorderColor;
                              hanenColorBorder =
                                  hanenColorBorder.withOpacity(0.2);
                              sharedPreferences.setString("name", perconalName);
                              sharedPreferences.setString("image", pathImage);
                            });
                          }
                        },
                        child: AnimatedContainer(
                          duration: const Duration(seconds: 1),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: majedColorBorder, width: 6),
                              color: majedColorContainer,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16))),
                          margin: const EdgeInsets.all(10),
                          width: widthMaged,
                          height: heightMaged,
                          child: Stack(
                            children: [
                              Positioned(
                                child: Transform.rotate(
                                  angle: pi,
                                  child: Visibility(
                                    visible: visabil == true ? false : true,
                                    child: Image.asset(
                                      "assets/images/majed.png",
                                      height: 180,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  top: 40,
                                  right: 80,
                                  child: Transform.rotate(
                                      angle: pi,
                                      child: Visibility(
                                          visible:
                                              visabil == true ? false : true,
                                          child: customText("ماجد")))),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ])
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: CustomButton(
              backgroundColor: btnColor,
              textBorderColor: lightBlackBorderColor,
              title: "اختيار",
              navigateTo: (context) {
                fetchUserData(perconalName, gender);
                sharedPreferences.setString("token", levelModel.accessToken!);

                return const LevelsScreen();
              },
            ),
          )
        ],
      ),
    ));
  }
}
