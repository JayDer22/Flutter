import 'package:flutter/material.dart';

class Addactivity extends StatefulWidget {
  const Addactivity({super.key});

  @override
  State<Addactivity> createState() => _AddactivityState();
}

class _AddactivityState extends State<Addactivity> {

  TextEditingController durationController = TextEditingController();

  String Selectedactivity = "Running";

  // Store saved data
  String savedWorkout = '';
  String savedDuration = '';

  List<String> Activity = [
    'Running',
    'Yoga',
    'Cycling',
    'Gym',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Add Activity",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Click + button to Add activity",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 20),

            FloatingActionButton(
              onPressed: () {

                showModalBottomSheet(
                  context: context,

                  builder: (context) {

                    return StatefulBuilder(
                      builder: (context, setModalState) {

                        return Padding(
                          padding: const EdgeInsets.all(20),

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [

                              const Text(
                                'Add Workout Activity',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Dropdown
                              DropdownButton<String>(
                                value: Selectedactivity,
                                isExpanded: true,

                                items: Activity.map((String workout) {
                                  return DropdownMenuItem<String>(
                                    value: workout,
                                    child: Text(workout),
                                  );
                                }).toList(),

                                onChanged: (value) {

                                  setModalState(() {
                                    Selectedactivity = value!;
                                  });
                                },
                              ),

                              const SizedBox(height: 20),

                              // Duration Field
                              TextFormField(
                                controller: durationController,
                                keyboardType: TextInputType.number,

                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter duration (minutes)',
                                ),
                              ),

                              const SizedBox(height: 20),

                              // Save Button
                              ElevatedButton(

                                onPressed: () {

                                  setState(() {

                                    savedWorkout = Selectedactivity;

                                    savedDuration =
                                        durationController.text;

                                  });

                                  Navigator.pop(context);
                                },

                                child: const Text("Save Activity"),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                );
              },

              child: const Icon(Icons.add),
            ),

            const SizedBox(height: 30),

            // Show Saved Data
            Text(
              "Workout: $savedWorkout",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Duration: $savedDuration minutes",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}