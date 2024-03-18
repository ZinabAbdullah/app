import 'package:flutter/material.dart';
import 'dart:async';

import 'package:learletters/screens/stipper_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => StipperScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Image.asset("assets/images/splash.png"),
        )),
      ),
    );
  }
}
