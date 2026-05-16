import 'package:flutter/material.dart';

class CustomButtonUI extends StatefulWidget {
  const CustomButtonUI({super.key});

  @override
  State<CustomButtonUI> createState() => _CustomButtonUIState();
}

class _CustomButtonUIState extends State<CustomButtonUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Button"),
      ),

      body: Center(
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,

          children: [

            Container(
              width: 200,
              height: 100,
              margin: const EdgeInsets.only(top: 30),

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),

              child: const Center(
                child: Text(
                  "Upload",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),


            Positioned(
              top: 0,

              child: Container(
                padding: const EdgeInsets.all(12),

                decoration: const BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),

                child: const Icon(
                  Icons.upload,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}