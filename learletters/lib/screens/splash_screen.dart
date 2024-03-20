import 'package:flutter/material.dart';
import 'package:learletters/main.dart';
import 'package:learletters/screens/screen_points.dart';
import 'dart:async';

import 'package:learletters/screens/stipper_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  String? pathImg;
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  validAndNavigate() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();

    Timer(const Duration(seconds: 2), () {
      if (sharedPreferences.getString("name") == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (_) => const StipperScreen()));
      } else {
        pathImg = sharedPreferences.getString("image");

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => ScreenPoints(
              pathImage: pathImg!,
            ),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    validAndNavigate();
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
      child: AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context, _) {
            return SlideTransition(
                position: slidingAnimation,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Image.asset(
                    "assets/images/splash.png",
                    fit: BoxFit.cover,
                  ),
                ));
          }),
    ));
  }
}
