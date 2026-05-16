import 'package:flutter/material.dart';

class Secondscreen extends StatefulWidget {
  const Secondscreen({super.key});

  @override
  State<Secondscreen> createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen",
        style: TextStyle(fontWeight: FontWeight.bold,
        fontSize: 15),),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Welcome")
          ],
        ),        
      ),
    );
  }
}
