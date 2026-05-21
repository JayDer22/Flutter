import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';
import 'login.dart';

class Introscreen extends StatefulWidget {
  const Introscreen({super.key});

  @override
  State<Introscreen> createState() => _IntroscreenState();
}

class _IntroscreenState extends State<Introscreen> {

  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    // super.initState();
    initPrefs();
  }

  // Initialize SharedPreferences
  void initPrefs() async {

    sharedPreferences = await SharedPreferences.getInstance();

    bool isIntroVisited =
        sharedPreferences.getBool("intro") ?? false;

    // If intro already seen
    if (isIntroVisited == true) {

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const FormEx(),
        ),
      );
    }
  }

  // When intro completed
  void onDone(BuildContext context) async {

    // Save intro status
    await sharedPreferences.setBool("intro", true);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const FormEx(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return IntroductionScreen(

      pages: [

        PageViewModel(
          title: "Welcome",

          body:
          "Pizza \n Welcome to your happy place for pizza lovers.\nHot, fresh, and irresistibly delicious pizzas served straight from the oven.",

          image: Image.asset(
            "assets/img.png",
            height: 250,
          ),
        ),

        PageViewModel(
          title: "Welcome",

          body:
          "Burger \n From classic cheeseburgers to loaded specials, we serve burgers worth craving. \n Big flavors, soft buns, and perfectly crafted goodness in every meal.",

          image: Image.asset(
            "assets/img_1.png",
            height: 250,
          ),
        ),

        PageViewModel(
          title: "Welcome",

          body:
          "Cold coffee \n Chill your day with our rich and creamy cold coffee.\nPerfectly blended for a refreshing and flavorful experience.",

          image: Image.asset(
            "assets/img_2.png",
            height: 250,
          ),
        ),
      ],

      showSkipButton: true,

      skip: const Text("Skip"),

      next: const Icon(Icons.arrow_forward),

      done: const Text(
        "Get Started",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),

      onDone: () => onDone(context),

      onSkip: () => onDone(context),
    );
  }
}