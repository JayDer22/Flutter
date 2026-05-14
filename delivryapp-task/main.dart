import 'package:flutter/material.dart';
import 'package:module3/Myapp/Splashscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'introscreen.dart';
import 'loginscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool introShown = prefs.getBool("introShown") ?? false;

  runApp(MyApp(introShown: introShown));
}

class MyApp extends StatelessWidget {
  final bool introShown;

  const MyApp({super.key, required this.introShown});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen1(),
    );
  }
}