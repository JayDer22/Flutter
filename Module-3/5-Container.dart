import 'package:flutter/material.dart';

class Container1 extends StatefulWidget {
  const Container1({super.key});

  @override
  State<Container1> createState() => _Container1State();
}

class _Container1State extends State<Container1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" "),      backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
body: Row(
 children: [
   Container(
     width: 100,
     height: 100,
     color: Colors.red,
   ),
   SizedBox(
     width: 10,
   ),
   Container(
     width: 150,
     height: 150,
     color: Colors.yellow,
   ),
   SizedBox(
     width: 10,
   ),
   Container(
     width: 200,
     height: 200,
     color: Colors.blue,
   ),
 ],
),
    );
  }
}
