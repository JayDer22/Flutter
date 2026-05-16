import 'package:flutter/material.dart';

class NameListScreen extends StatelessWidget {
  const NameListScreen({super.key});

  final List<String> names = const [
    "Jay",
    "Rahul",
    "Priya",
    "Amit",
    "Neha",
    "Rohan",
    "Karan",
    "Sneha",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" "),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
            onTap: () {
              print("${names[index]} tapped");
            },
          );
        },
      ),
    );
  }
}