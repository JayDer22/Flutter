import 'package:flutter/material.dart';
import 'task-1/task_1_screen.dart';
import 'task-2/task_2_screen.dart';
import 'task-3/task_3_screen.dart';
import 'task-4/task_4_screen.dart';
import 'task-5/task_5_screen.dart';

class Session7Menu extends StatelessWidget {
  const Session7Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Session 7 Tasks')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Task 1: Basic Fetch'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const Task1Screen())),
          ),
          ListTile(
            title: const Text('Task 2: In-Memory Cache'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const Task2Screen())),
          ),
          ListTile(
            title: const Text('Task 3: SQLite Caching'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const Task3Screen())),
          ),
          ListTile(
            title: const Text('Task 4: Offline Banner'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const Task4Screen())),
          ),
          ListTile(
            title: const Text('Task 5: Refresh Button'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const Task5Screen())),
          ),
        ],
      ),
    );
  }
}
