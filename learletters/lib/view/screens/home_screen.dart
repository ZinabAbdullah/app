import 'package:flutter/material.dart';
import 'package:learletters/color.dart';

import '../../components/custom_button.dart';
import 'intro_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: Stack(
                        children: [
                          Image.asset("assets/images/buttonbackground.png"),
                          Image.asset("assets/images/backword.png"),
                        ],
                        alignment: Alignment.center,
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    GestureDetector(
                      child: Stack(
                        children: [
                          Image.asset("assets/images/buttonbackground.png"),
                          Image.asset("assets/images/forword.png"),
                        ],
                        alignment: Alignment.center,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                      },
                    ),
                  ],
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
                  navigateTo: (context) => IntroScreen(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
