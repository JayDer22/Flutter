import 'package:flutter/material.dart';

class FeedbackFormPage extends StatefulWidget {
  const FeedbackFormPage({super.key});

  @override
  State<FeedbackFormPage> createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {

  TextEditingController nameController =
  TextEditingController();

  TextEditingController commentController =
  TextEditingController();

  String selectedCategory = "App";

  List<String> categories = [
    "App",
    "Service",
    "Design",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback Form"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [


            TextField(
              controller: nameController,

              decoration: const InputDecoration(
                labelText: "Enter Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),


            TextField(
              controller: commentController,
              maxLines: 4,

              decoration: const InputDecoration(
                labelText: "Enter Comments",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),


            DropdownButtonFormField(
              value: selectedCategory,

              items: categories.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),

              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },

              decoration: const InputDecoration(
                labelText: "Select Category",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),


            ElevatedButton(
              onPressed: () {

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Feedback Submitted"),
                  ),
                );
              },

              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}