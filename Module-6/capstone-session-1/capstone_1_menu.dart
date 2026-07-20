import 'package:flutter/material.dart';
import 'task-1/movie_screen.dart';
import 'task-2/movie_screen.dart';
import 'task-3/movie_screen.dart';
import 'task-4/movie_screen.dart';

class Capstone1Menu extends StatelessWidget {
  const Capstone1Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Capstone Session-1')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Task 1: Basic TMDB Fetch'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const MovieScreenTask1())),
          ),
          ListTile(
            title: const Text('Task 2: Dynamic UI Update'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const MovieScreenTask2())),
          ),
          ListTile(
            title: const Text('Task 3: Loading & Error Handling'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const MovieScreenTask3())),
          ),
          ListTile(
            title: const Text('Task 4: Empty List Handling'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const MovieScreenTask4())),
          ),
        ],
      ),
    );
  }
}
