import 'package:flutter/material.dart';
import 'resume_template1.dart';

class ResumePreviewWidget extends StatelessWidget {
  const ResumePreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12), // small edge spacing (optional)
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1),
              ),
            ],
          ),
          child: const ResumeTemplate1(),
        ),
      ),
    );
  }
}