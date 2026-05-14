import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'introscreen.dart';

class Splashscreen1 extends StatefulWidget {
  const Splashscreen1({super.key});

  @override
  State<Splashscreen1> createState() => _Splashscreen1State();
}

class _Splashscreen1State extends State<Splashscreen1> {

  bool internet = true;

  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: internet

            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Lottie.asset(
              "assets/Delivery.json",
              height: 200,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            const CircularProgressIndicator(),

            const SizedBox(height: 20),

            const Text(
              "Checking Internet...",
              style: TextStyle(fontSize: 18),
            ),
          ],
        )

            : const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Icon(
              Icons.wifi_off,
              size: 60,
              color: Colors.red,
            ),

            SizedBox(height: 10),

            Text(
              "No Internet Connection",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> checkInternet() async {

    var connectivityResult =
    await Connectivity().checkConnectivity();

    if (connectivityResult == ConnectivityResult.none) {

      setState(() {
        internet = false;
      });

    } else {

      Timer(const Duration(seconds: 3), () {

        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const Introscreen(),
          ),
        );
      });
    }
  }
}