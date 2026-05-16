import 'package:flutter/material.dart';

class ExpandCollapsePage extends StatefulWidget {
  const ExpandCollapsePage({super.key});

  @override
  State<ExpandCollapsePage> createState() =>
      _ExpandCollapsePageState();
}

class _ExpandCollapsePageState
    extends State<ExpandCollapsePage> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Animated Container"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [


            ElevatedButton(
              onPressed: () {

                setState(() {
                  isExpanded = !isExpanded;
                });
              },

              child: Text(
                isExpanded
                    ? "Collapse"
                    : "Expand",
              ),
            ),

            const SizedBox(height: 20),


            AnimatedContainer(

              duration:
              const Duration(seconds: 1),

              width: 300,

              height:
              isExpanded ? 200 : 80,

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius:
                BorderRadius.circular(20),
              ),

              child: const Text(
                "This content expands and collapses using AnimatedContainer widget.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}