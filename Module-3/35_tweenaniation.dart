import 'package:flutter/material.dart';

class PulseButtonPage extends StatefulWidget {
  const PulseButtonPage({super.key});

  @override
  State<PulseButtonPage> createState() =>
      _PulseButtonPageState();
}

class _PulseButtonPageState
    extends State<PulseButtonPage> {

  bool animate = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(milliseconds: 500),
          () {
        setState(() {
          animate = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Pulse Button"),
      ),

      body: Center(
        child: TweenAnimationBuilder(

          tween: Tween<double>(
            begin: 1.0,
            end: animate ? 1.3 : 1.0,
          ),

          duration:
          const Duration(seconds: 1),

          curve: Curves.easeInOut,

          builder: (context, value, child) {

            return Transform.scale(
              scale: value,

              child: ElevatedButton(
                onPressed: () {},

                child: const Text(
                  "Click Me",
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}