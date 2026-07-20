import 'package:flutter/material.dart';
import 'task-1/song_form.dart';
import 'task-2/movie_post.dart';
import 'task-3/feedback_form.dart';
import 'task-4/header_post.dart';
import 'task-5/error_handling.dart';

class Session5Menu extends StatelessWidget {
  const Session5Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Session 5 Tasks')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Task 1: Song & Artist Form'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const SongForm())),
          ),
          ListTile(
            title: const Text('Task 2: Movie POST Request'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const MoviePostScreen())),
          ),
          ListTile(
            title: const Text('Task 3: Zomato Feedback Form'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const FeedbackForm())),
          ),
          ListTile(
            title: const Text('Task 4: Custom Headers'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const HeaderPostScreen())),
          ),
          ListTile(
            title: const Text('Task 5: Error Handling'),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => const ErrorHandlingScreen())),
          ),
        ],
      ),
    );
  }
}
