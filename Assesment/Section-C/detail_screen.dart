import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  final String title;

  final List<Map<String, String>> activities;

  const DetailScreen({
    super.key,
    required this.title,
    required this.activities,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(title),
      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(15),

        itemCount: activities.length,

        itemBuilder: (context, index) {

          final activity = activities[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 15),

            child: ListTile(

              leading: const CircleAvatar(
                backgroundColor: Colors.teal,

                child: Icon(
                  Icons.health_and_safety,
                  color: Colors.white,
                ),
              ),

              title: Text(
                activity["title"]!,
              ),

              subtitle: Text(
                activity["subtitle"]!,
              ),

              trailing: Text(
                activity["metric"]!,

                style: const TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}