import 'package:flutter/material.dart';

void main() {
  runApp(const Wizaedexit());
}

class Wizaedexit extends StatefulWidget {
  const Wizaedexit({super.key});

  @override
  State<Wizaedexit> createState() => _WizaedexitState();
}

class _WizaedexitState extends State<Wizaedexit> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      initialRoute: '/dashboard',

      routes: {

        '/dashboard': (context) => const DashboardScreen(),

        '/step1': (context) => const WorkoutStep1(),

        '/step2': (context) => const WorkoutStep2(),

        '/step3': (context) => const WorkoutStep3(),
      },
    );
  }
}

// ================= DASHBOARD =================

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Dashboard"),
      ),

      body: Center(

        child: ElevatedButton(

          onPressed: () {

            Navigator.pushNamed(context, '/step1');

          },

          child: const Text("Start Workout Wizard"),
        ),
      ),
    );
  }
}

// ================= STEP 1 =================

class WorkoutStep1 extends StatelessWidget {
  const WorkoutStep1({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Workout Step 1"),
      ),

      body: Center(

        child: ElevatedButton(

          onPressed: () {

            Navigator.pushNamed(context, '/step2');

          },

          child: const Text("Next Step"),
        ),
      ),
    );
  }
}

// ================= STEP 2 =================

class WorkoutStep2 extends StatelessWidget {
  const WorkoutStep2({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Workout Step 2"),
      ),

      body: Center(

        child: ElevatedButton(

          onPressed: () {

            Navigator.pushNamed(context, '/step3');

          },

          child: const Text("Next Step"),
        ),
      ),
    );
  }
}

// ================= STEP 3 =================

class WorkoutStep3 extends StatelessWidget {
  const WorkoutStep3({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Workout Step 3"),
      ),

      body: Center(

        child: ElevatedButton(

          onPressed: () {

            Navigator.popUntil(
              context,
              ModalRoute.withName('/dashboard'),
            );

          },

          child: const Text("Finish Workout"),
        ),
      ),
    );
  }
}