import 'package:flutter/material.dart';
import 'package:learletters/screens/challenge_screen1.dart';
import 'package:learletters/screens/home_screen.dart';
import 'package:learletters/screens/s.dart';
import 'package:learletters/screens/splash_screen.dart';

import 'components/pop.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Blabeloo"),
      home: SplashScreen(),
    );
  }
}
