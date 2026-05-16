import 'package:flutter/material.dart';

class Hellowworld extends StatefulWidget {
  const Hellowworld({super.key});

  @override
  State<Hellowworld> createState() => _HellowworldState();
}

class _HellowworldState extends State<Hellowworld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(" "),),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 250,),
            Text("Hello! Flutter")
          ],
        ),
      ),
    );
  }
}
