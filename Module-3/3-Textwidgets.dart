import 'package:flutter/material.dart';

class Text1 extends StatefulWidget {
  const Text1({super.key});

  @override
  State<Text1> createState() => _Text1State();
}

class _Text1State extends State<Text1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" "),      backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(

          children: [
            Text("Hello this is my first app",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.red),),
            Text("My name is Jay Der",style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,color: Colors.green),)

          ],
        ),
      ),
    );
  }
}
