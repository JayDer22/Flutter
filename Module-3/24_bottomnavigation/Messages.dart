import 'package:flutter/material.dart';

import 'News.dart';

import 'Profile1.dart';

class MessagesPage extends StatelessWidget {

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
        title: Text("Messages Page"),
      ),

      body: Center(
        child: Text(
          "Messages Page",
          style: TextStyle(fontSize: 25),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,

        onTap: (index) {

          if (index == 0) {
            changePage(context, NewsPage());
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