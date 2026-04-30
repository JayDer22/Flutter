import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: helloworld()));
}

class helloworld extends StatefulWidget {
  @override
  helloworldState createState() => helloworldState();
}

class helloworldState extends State<helloworld> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello world")),
      body: Center(child: Text("Jay Der")),
    );
  }
}
