import 'package:flutter/material.dart';

class ChangeImagePage extends StatefulWidget {
  const ChangeImagePage({super.key});

  @override
  State<ChangeImagePage> createState() => _ChangeImagePageState();
}

class _ChangeImagePageState extends State<ChangeImagePage> {

  String imageUrl =
      "https://images.unsplash.com/photo-1506744038136-46273834b3fb";

  void changeImage() {
    setState(() {
      imageUrl =
      "https://images.unsplash.com/photo-1493246507139-91e8fad9978e";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Change Image"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [


            Image.network(
              imageUrl,
              height: 250,
              width: 300,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),


            ElevatedButton(
              onPressed: changeImage,

              child: const Text("Change Image"),
            ),
          ],
        ),
      ),
    );
  }
}