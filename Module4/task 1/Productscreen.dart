import 'package:flutter/material.dart';

import 'Detailspage.dart';

class Productscreen extends StatefulWidget {
  const Productscreen({super.key});

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Product Screen",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Container(
          height: 280,
          width: 220,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [


              Expanded(
                child: Image.asset(
                  "img.png",
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 10),


              const Text(
                "Head Phone",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Spacer(),


              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  onPressed: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Detailspage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

