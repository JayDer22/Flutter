import 'package:flutter/material.dart';

class Indicatore extends StatefulWidget {
  const Indicatore({super.key});

  @override
  State<Indicatore> createState() => _IndicatoreState();
}

class _IndicatoreState extends State<Indicatore> {

  // User completed steps
  int completedSteps = 2000;

  // Total goal
  int totalGoal = 10000;

  @override
  Widget build(BuildContext context) {

    // Progress calculation
    double progress = completedSteps / totalGoal;

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.teal,

        title: const Text(
          "Step Progress",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text(
                "Daily Step Goal",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Progress Bar
              LinearProgressIndicator(

                value: progress,

                backgroundColor: Colors.grey.shade300,

                valueColor: AlwaysStoppedAnimation<Color>(

                  progress < 0.4
                      ? Colors.red
                      : progress < 0.7
                      ? Colors.orange
                      : Colors.green,
                ),

                minHeight: 12,
              ),

              const SizedBox(height: 20),

              // Step Text
              Text(
                "$completedSteps / $totalGoal Steps",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Percentage Text
              Text(
                "${(progress * 100).toInt()} %",
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 30),

              // Button
              ElevatedButton(

                onPressed: () {

                  setState(() {

                    // Increase steps
                    if (completedSteps < totalGoal) {

                      completedSteps += 1000;

                    }

                  });
                },

                child: const Text(
                  "Complete 1000 Steps",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}