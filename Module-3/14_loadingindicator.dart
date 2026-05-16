import 'package:flutter/material.dart';

class PhotoGalleryPage extends StatefulWidget {
  const PhotoGalleryPage({super.key});

  @override
  State<PhotoGalleryPage> createState() => _PhotoGalleryPageState();
}

class _PhotoGalleryPageState extends State<PhotoGalleryPage> {

  List<String> images = [
    "https://picsum.photos/300/300?1",
    "https://picsum.photos/300/300?2",
    "https://picsum.photos/300/300?3",
    "https://picsum.photos/300/300?4",
    "https://picsum.photos/300/300?5",
    "https://picsum.photos/300/300?6",
    "https://picsum.photos/300/300?7",
    "https://picsum.photos/300/300?8",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery"),
      ),

      body: GridView.builder(
        padding: const EdgeInsets.all(10),

        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),

        itemCount: images.length,

        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(15),

            child: Stack(
              alignment: Alignment.center,

              children: [


                const CircularProgressIndicator(),


                Image.network(
                  images[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}