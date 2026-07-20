import 'package:flutter/material.dart';
import 'task-1/movie_screen.dart';
import 'task-2/movie_screen.dart';
import 'task-3/movie_screen.dart';
import 'task-4/movie_screen.dart';

class Capstone2Menu extends StatelessWidget {
  const Capstone2Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capstone Session-2')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Task 1: Fetch & Save to SQLite'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const MovieScreenTask1())),
          ),
          ListTile(
            title: const Text('Task 2: Offline Data Loading'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const MovieScreenTask2())),
          ),
          ListTile(
            title: const Text('Task 3: Manual Refresh Button'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const MovieScreenTask3())),
          ),
          ListTile(
            title: const Text('Task 4: Auto Connectivity Switch'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const MovieScreenTask4())),
          ),
        ],
      ),
    );
  }
}
