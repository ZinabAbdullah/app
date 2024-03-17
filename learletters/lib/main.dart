import 'package:flutter/material.dart';
import 'package:learletters/view/screens/challenge_screen1.dart';
import 'package:learletters/view/screens/choose_screen.dart';
import 'package:learletters/view/screens/home_screen1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Blabeloo"),
      home: FirstChallengeScreen(),
    );
  }
}
