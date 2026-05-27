import 'package:flutter/material.dart';

class BottomNavPage extends StatefulWidget {
  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {

  int currentIndex = 0;


  final List<Widget> pages = [
    Center(
      child: Text(
        "Home Screen",
        style: TextStyle(fontSize: 24),
      ),
    ),

    Center(
      child: Text(
        "Profile Screen",
        style: TextStyle(fontSize: 24),
      ),
    ),

    Center(
      child: Text(
        "Settings Screen",
        style: TextStyle(fontSize: 24),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Bottom Navigator"),
      ),

      body: pages[currentIndex],

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),

        ],
      ),
    );
  }
}
