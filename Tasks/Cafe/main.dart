import 'package:flutter/material.dart';
import 'package:untitled6/cafe/splashscreen.dart';

import '../container.dart';
import '../expand.dart';
import 'intro_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),

    );
  }
}
