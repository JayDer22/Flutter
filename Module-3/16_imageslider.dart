import 'dart:async';

import 'package:flutter/material.dart';

class ImageCarouselPage extends StatefulWidget {
  const ImageCarouselPage({super.key});

  @override
  State<ImageCarouselPage> createState() => _ImageCarouselPageState();
}

class _ImageCarouselPageState extends State<ImageCarouselPage> {

  final PageController pageController = PageController();

  List<String> images = [
    "https://picsum.photos/400/200?1",
    "https://picsum.photos/400/200?2",
    "https://picsum.photos/400/200?3",
    "https://picsum.photos/400/200?4",
  ];

  int currentPage = 0;

  @override
  void initState() {
    super.initState();

    Timer.periodic(
      const Duration(seconds: 3),
          (Timer timer) {

        if (currentPage < images.length - 1) {
          currentPage++;
        } else {
          currentPage = 0;
        }

        pageController.animateToPage(
          currentPage,

          duration: const Duration(milliseconds: 500),

          curve: Curves.easeIn,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Carousel"),
      ),

      body: PageView.builder(
        controller: pageController,

        itemCount: images.length,

        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(20),

            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),

              child: Image.network(
                images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}