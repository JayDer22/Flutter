import 'package:flutter/material.dart';

class Gridex extends StatefulWidget {
  const Gridex({super.key});

  @override
  State<Gridex> createState() => _GridexState();
}

class _GridexState extends State<Gridex> {
  final List<String> imageUrls = [
    'https://picsum.photos/id/1011/300/300',
    'https://picsum.photos/id/1012/300/300',
    'https://picsum.photos/id/1013/300/300',
    'https://picsum.photos/id/1014/300/300',
    'https://picsum.photos/id/1015/300/300',
    'https://picsum.photos/id/1016/300/300',
    'https://picsum.photos/id/1018/300/300',
    'https://picsum.photos/id/1020/300/300',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: imageUrls.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 images per row
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}