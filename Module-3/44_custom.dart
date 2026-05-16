import 'package:flutter/material.dart';




class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("UI Practice Demo")),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 20),

            /// 1. Avatar Badge
            AvatarBadge(
              imageUrl: "https://i.pravatar.cc/150",
              isOnline: true,
            ),

            SizedBox(height: 20),

            /// 2. Profile Layout
            ProfileSection(),

            SizedBox(height: 20),

            /// 3. Product List
            ProductList(),

            SizedBox(height: 20),

            /// 4. Custom Button
            CustomButton(
              text: "Buy Now",
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


class AvatarBadge extends StatelessWidget {
  final String imageUrl;
  final bool isOnline;

  const AvatarBadge({
    super.key,
    required this.imageUrl,
    required this.isOnline,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(imageUrl),
        ),

        Positioned(
          bottom: 5,
          right: 5,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isOnline ? Colors.green : Colors.grey,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}


class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage("https://i.pravatar.cc/200"),
          ),
          const SizedBox(width: 15),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "John Doe",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text("Flutter Developer"),
            ],
          ),
        ],
      ),
    );
  }
}


class ProductList extends StatelessWidget {
  const ProductList({super.key});

  final List<Map<String, String>> products = const [
    {
      "name": "Shoes",
      "price": "₹1999",
      "image": "https://i.imgur.com/qIufhof.png"
    },
    {
      "name": "Watch",
      "price": "₹999",
      "image": "https://i.imgur.com/0umadnY.jpg"
    },
    {
      "name": "Headphones",
      "price": "₹1499",
      "image": "https://i.imgur.com/5tj6S7Ol.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: products.map((product) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: Image.network(product["image"]!),
            title: Text(product["name"]!),
            subtitle: Text(product["price"]!),
          ),
        );
      }).toList(),
    );
  }
}


class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}