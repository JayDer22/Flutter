import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dashboard.dart';
import 'resumeform.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ResumeData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const ResumAIHomeScreen(),
      ),
    );
  }
}