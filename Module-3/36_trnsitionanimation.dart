import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("First Page"),
      ),

      body: Center(
        child: ElevatedButton(

          onPressed: () {

            Navigator.push(
              context,

              PageRouteBuilder(

                pageBuilder:
                    (context, animation,
                    secondaryAnimation) {

                  return const SecondPage();
                },

                transitionsBuilder:
                    (context, animation,
                    secondaryAnimation,
                    child) {

                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;

                  const curve = Curves.ease;

                  var tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(
                    CurveTween(curve: curve),
                  );

                  return SlideTransition(
                    position:
                    animation.drive(tween),

                    child: child,
                  );
                },
              ),
            );
          },

          child: const Text(
            "Go To Second Page",
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() =>
      _SecondPageState();
}

class _SecondPageState
    extends State<SecondPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Second Page"),
      ),

      body: const Center(
        child: Text(
          "Welcome To Second Page",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}