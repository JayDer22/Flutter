import 'package:flutter/material.dart';
import 'task-1/ipl_matches.dart';
import 'task-2/movie_timeout.dart';
import 'task-3/restaurant_retry.dart';
import 'task-4/explanation_screen.dart';

class Session6Menu extends StatelessWidget {
  const Session6Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Session 6 Tasks')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Task 1: IPL Match Errors (400, 401, 500)'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const IplMatchesScreen())),
          ),
          ListTile(
            title: const Text('Task 2: Movie Timeout (5s)'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const MovieTimeoutScreen())),
          ),
          ListTile(
            title: const Text('Task 3: Restaurant Retry Button'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const RestaurantRetryScreen())),
          ),
          ListTile(
            title: const Text('Task 4: SocketException Decode'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const ExplanationScreen())),
          ),
        ],
      ),
    );
  }
}
