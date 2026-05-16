import 'package:flutter/material.dart';
import '21-Secondscreen.dart';
class Switchscreen extends StatefulWidget {
  const Switchscreen({super.key});

  @override
  State<Switchscreen> createState() => _SwitchscreenState();
}

class _SwitchscreenState extends State<Switchscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Secondscreen()));
            }, child: Text("Next Screen"))
          ],
        ),
      ),
    );
  }
}
