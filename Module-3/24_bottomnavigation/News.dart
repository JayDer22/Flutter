import 'package:flutter/material.dart';

import 'Profile1.dart';
import 'Messages.dart';

class NewsPage extends StatelessWidget {

  void changePage(BuildContext context, Widget page) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("News Page"),
      ),

      body: Center(
        child: Text(
          "News Page",
          style: TextStyle(fontSize: 25),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,

        onTap: (index) {

          if (index == 1) {
            changePage(context, MessagesPage());
          }

          if (index == 2) {
            changePage(context, ProfilePage());
          }
        },

        items: [

          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "News",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Messages",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

        ],
      ),
    );
  }
}