import 'package:flutter/material.dart';
import 'package:learletters/color.dart';

import '../../components/custom_button.dart';
import '../../components/custom_header.dart';
import 'home_screen2.dart';
import 'intro_screen.dart';

class FirstHomeScreen extends StatefulWidget {
  const FirstHomeScreen({Key? key}) : super(key: key);

  @override
  _FirstHomeScreenState createState() => _FirstHomeScreenState();
}

class _FirstHomeScreenState extends State<FirstHomeScreen> {
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
                  navigateTo: (context) => SecondHomeScreen(),
                ),
                Image.asset("assets/images/ألف.png"),
                SizedBox(
                  height: 15,
                ),
                Image.asset("assets/images/microphone.png"),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  navigateTo: (context) => SecondHomeScreen(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
