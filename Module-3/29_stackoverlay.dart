import 'package:flutter/material.dart';

class StackExample extends StatefulWidget {
  const StackExample({super.key});

  @override
  State<StackExample> createState() => _StackExampleState();
}

class _StackExampleState extends State<StackExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stack Overlay"),
      ),

      body: Center(
        child: Stack(
          alignment: Alignment.center,

          children: [

            Container(
              width: 300,
              height: 200,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),

                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              width: 300,
              height: 200,

              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(20),
              ),
            ),


            const Text(
              "Beautiful Nature",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}