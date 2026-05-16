import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double percentage;

  const CustomProgressBar({
    super.key,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {

    double safePercentage = percentage.clamp(0, 100);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: double.infinity,
          height: 20,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [

              FractionallySizedBox(
                widthFactor: safePercentage / 100,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 8),


        Text(
          "${safePercentage.toStringAsFixed(0)}%",
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}