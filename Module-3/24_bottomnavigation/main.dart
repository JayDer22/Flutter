import 'package:flutter/material.dart';
import 'package:module3/24_bottomnavigation/News.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: NewsPage(),



    );
  }
}

