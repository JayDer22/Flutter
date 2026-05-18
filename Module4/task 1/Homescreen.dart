import 'package:flutter/material.dart';

import 'Productscreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Productscreen()));
            }, child: Text("Product screen"))
          ],
        ),
      ),
    );
  }
}
