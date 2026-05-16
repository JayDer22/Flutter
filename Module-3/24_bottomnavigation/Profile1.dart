import 'package:flutter/material.dart';

import 'News.dart';
import 'Messages.dart';

class ProfilePage extends StatelessWidget {

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
        title: Text("Profile Page"),
      ),

      body: Center(
        child: Text(
          "Profile Page",
          style: TextStyle(fontSize: 25),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,

        onTap: (index) {

          if (index == 0) {
            changePage(context, NewsPage());
          }

          if (index == 1) {
            changePage(context, MessagesPage());
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