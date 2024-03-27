import 'package:flutter/material.dart';
import 'package:learletters/color.dart';
import '../../components/custom_button.dart';
import '../../components/custom_header.dart';
import '../components/custom_paint.dart';
import 'home_screen3.dart';
import 'home_screen1.dart';

class SecondHomeScreen extends StatefulWidget {
  const SecondHomeScreen({Key? key}) : super(key: key);

  @override
  _SecondHomeScreenState createState() => _SecondHomeScreenState();
}

class _SecondHomeScreenState extends State<SecondHomeScreen> {
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
            child: Center(
                child: Column(children: [
              CustomHeader(
                navigateTo: (context) => const ThirdHomeScreen(),
              ),
              const SizedBox(
                height: 70,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  SizedBox(
                      height: 278.43,
                      child: Image.asset("assets/images/letter1.png")),
                  SizedBox(height: 200, width: 20, child: DrawOnLetter()),
                ],
              ),
              const SizedBox(
                height: 150,
              ),
              CustomButton(
                navigateTo: (context) {
                  return ThirdHomeScreen();
                },
                backgroundColor: lightBlueColor,
                textBorderColor: lightBlackBorderColor,
                title: 'التالي',
              ),
            ])),
          ),
        ),
      ),
    );
  }
}
