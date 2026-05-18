import 'package:flutter/material.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({super.key});

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details screen",
        style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      ),
      ),
      body: Center(
        child: Container(
          height: 280,
          width: 1000,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Transparent-style headphones like Nothing are becoming popular.\nExtra-large “speaker headphones” from JLab are getting attention because they can work like mini Bluetooth speakers.\nANC headphones now commonly offer 40–80 hour battery life.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}
