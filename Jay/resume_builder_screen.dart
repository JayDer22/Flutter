import 'package:flutter/material.dart';

class ResumeBuilderPlaceholderScreen extends StatelessWidget {
  const ResumeBuilderPlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Resume Builder")),
      body: const Center(child: Text("Resume Builder Screen")),
    );
  }
}
