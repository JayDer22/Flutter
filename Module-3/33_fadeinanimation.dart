import 'package:flutter/material.dart';

class FadeImagePage extends StatefulWidget {
  const FadeImagePage({super.key});

  @override
  State<FadeImagePage> createState() => _FadeImagePageState();
}

class _FadeImagePageState extends State<FadeImagePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Fade In Image"),
      ),

      body: Center(
        child: FadeInImage(

          placeholder:
          const AssetImage("assets/photo.jpg"),

          image: const NetworkImage(
            "https://picsum.photos/400/300",
          ),

          width: 300,
          height: 250,

          fit: BoxFit.cover,

          fadeInDuration:
          const Duration(seconds: 2),
        ),
      ),
    );
  }
}