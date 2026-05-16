import 'package:flutter/material.dart';

class CustomList extends StatefulWidget {
  CustomList({super.key});

  @override
  State<CustomList> createState() => _CustomListState();
}

class _CustomListState extends State<CustomList> {
  final List<String> items = [
    "Home",
    "Profile",
    "Settings",
    "Logout",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom List"),
      ),

      body: ListView.builder(
        itemCount: items.length,

        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),

            child: ListTile(
              leading: const Icon(Icons.person),

              title: Text(items[index]),

              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),

                onPressed: () {
                  print("${items[index]} deleted");
                },
              ),
            ),
          );
        },
      ),
    );
  }
}