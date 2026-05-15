import 'package:flutter/material.dart';
import 'package:module3/Healthcare/Addactivity.dart';
import 'package:module3/Healthcare/indicatore.dart';
import 'package:module3/Healthcare/validator.dart';
import 'wizaedexit.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wizaedexit(),



    );
  }
}