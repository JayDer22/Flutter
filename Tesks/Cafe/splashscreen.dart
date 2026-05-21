import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'intro_screen.dart';
import 'login.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    super.initState();

    checkconnectivity();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/waitress-serving-drink-in-hotel.json',
        ),
      ),
    );
  }

  void checkconnectivity() async {

    SharedPreferences prefs =
    await SharedPreferences.getInstance();

    bool? introSeen = prefs.getBool("intro");

    Timer(
      const Duration(seconds: 5),
          () {

        if (introSeen == true) {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Introscreen(),
            ),
          );

        } else {

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Introscreen(),
            ),
          );

        }

      },
    );
  }
}