import 'package:flutter/material.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  List<String> products = [
    "Shoes",
    "Watch",
    "Bag",
    "Laptop",
    "Phone",
    "Camera",
    "Headphones",
    "Keyboard",
    "Mouse",
    "Tablet",
    "Speaker",
    "TV",
    "Bottle",
    "Chair",
    "Book",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Horizontal List"),
      ),

      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        child: Row(
          children: products.map((item) {
            return Container(
              width: 180,
              height: 200,
              margin: const EdgeInsets.all(10),
              color: Colors.blue,

              child: Center(
                child: Text(
                  item,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}