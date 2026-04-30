import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Welcome()));
}

class Welcome extends StatefulWidget {
  @override
  welcomeState createState() => welcomeState();
}

class welcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App",style: TextStyle(fontSize: 20.00,fontWeight: FontWeight.bold,color: Colors.teal))),
      body: Center(child: Text("Hello welcome to my app",style: TextStyle(fontSize: 15.00,fontWeight: FontWeight.bold,color: Colors.red),
      ),
      ),
      );
  }
}
