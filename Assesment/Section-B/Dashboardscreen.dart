import 'package:flutter/material.dart';
import 'Healthcard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PulseFit Dashboard'),
        centerTitle: true,
      ),

      body: ListView(
        children: const [
          HealthCard(
            icon: Icons.favorite,
            title: 'Heart Rate',
            value: '72',
            unit: 'BPM',
            color: Colors.red,
          ),

          HealthCard(
            icon: Icons.local_fire_department,
            title: 'Calories Burned',
            value: '540',
            unit: 'kcal',
            color: Colors.orange,
          ),

          HealthCard(
            icon: Icons.directions_walk,
            title: 'Steps',
            value: '8500',
            unit: 'steps',
            color: Colors.green,
          ),

          HealthCard(
            icon: Icons.water_drop,
            title: 'Water Intake',
            value: '2.5',
            unit: 'L',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}