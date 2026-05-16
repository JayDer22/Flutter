import 'package:flutter/material.dart';

class CardUI extends StatefulWidget {
  const CardUI({super.key});

  @override
  State<CardUI> createState() => _CardUIState();
}

class _CardUIState extends State<CardUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card UI"),
      ),

      body: Center(
        child: Stack(
          clipBehavior: Clip.none,

          children: [

            Container(
              width: 300,
              height: 180,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                  ),
                ],
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Thia is my app ",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: -20,
              right: 20,

              child: FloatingActionButton(
                onPressed: () {},

                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}