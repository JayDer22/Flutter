import 'package:flutter/material.dart';

class AssetImagePage extends StatefulWidget {
  const AssetImagePage({super.key});

  @override
  State<AssetImagePage> createState() => _AssetImagePageState();
}

class _AssetImagePageState extends State<AssetImagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BoxFit Example"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            const SizedBox(height: 20),

            const Text(
              "BoxFit.cover",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Container(
              height: 200,
              width: 300,
              color: Colors.grey,

              child: Image.asset(
                "img.png",
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "BoxFit.contain",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Container(
              height: 200,
              width: 300,
              color: Colors.grey,

              child: Image.asset(
                "img.png",
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "BoxFit.fill",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Container(
              height: 200,
              width: 300,
              color: Colors.grey,

              child: Image.asset(
                "img.png",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}