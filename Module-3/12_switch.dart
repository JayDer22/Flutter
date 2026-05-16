import 'package:flutter/material.dart';

class ToggleSwitchPage extends StatefulWidget {
  const ToggleSwitchPage({super.key});

  @override
  State<ToggleSwitchPage> createState() => _ToggleSwitchPageState();
}

class _ToggleSwitchPageState extends State<ToggleSwitchPage> {

  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: isOn ? Colors.blue : Colors.white,

      appBar: AppBar(
        title: const Text("Toggle Switch"),
      ),

      body: Center(
        child: Switch(

          value: isOn,

          onChanged: (value) {
            setState(() {
              isOn = value;
            });
          },
        ),
      ),
    );
  }
}