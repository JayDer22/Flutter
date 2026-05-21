import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Login.dart';


class SplashScreen extends StatefulWidget
{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen>
{

  @override
  void initState()
  {
   // super.initState();

    checkconnectivity();
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold
      (
      body: Center
        (
        //child: Image.asset("assets/tops.jpg",width: 250,height: 250,),
        child: Lottie.asset('assets/shop.json')
      ),
    );
  }

  checkconnectivity() async {
    var connection = await Connectivity().checkConnectivity();

    if (connection.contains(ConnectivityResult.mobile) ||
        connection.contains(ConnectivityResult.wifi)) {

      Timer(Duration(seconds: 5), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      });

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Internet is not connected")),
      );
    }
  }
}