import 'package:flutter/material.dart';
import 'package:learletters/color.dart';
import '../../components/custom_button.dart';
import '../../components/custom_header.dart';
import 'home_screen3.dart';
import 'intro_screen.dart';

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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                CustomHeader(
                  navigateTo: (context) => ThirdHomeScreen(),
                ),
                Image.asset("assets/images/letter1.png"),
                SizedBox(
                  height: 30,
                ),
                CustomButton(
                  navigateTo: (context) => ThirdHomeScreen(),
                  backgroundColor: lightBlueColor,
                  textBorderColor: lightBlackBorderColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
