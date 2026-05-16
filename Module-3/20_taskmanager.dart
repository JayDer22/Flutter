import 'package:flutter/material.dart';

class TaskManagerPage extends StatefulWidget {
  const TaskManagerPage({super.key});

  @override
  State<TaskManagerPage> createState() => _TaskManagerPageState();
}

class _TaskManagerPageState extends State<TaskManagerPage> {

  TextEditingController taskController =
  TextEditingController();

  List<Map<String, dynamic>> tasks = [];

  void addTask() {

    if (taskController.text.isNotEmpty) {

      setState(() {

        tasks.add({
          "title": taskController.text,
          "completed": false,
        });

        taskController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Task Manager"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [


            TextField(
              controller: taskController,

              decoration: const InputDecoration(
                hintText: "Enter Task",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),


            ElevatedButton(
              onPressed: addTask,

              child: const Text("Add Task"),
            ),

            const SizedBox(height: 20),


            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,

                itemBuilder: (context, index) {

                  return CheckboxListTile(

                    title: Text(
                      tasks[index]["title"],
                    ),

                    value: tasks[index]["completed"],

                    onChanged: (value) {

                      setState(() {

                        tasks[index]["completed"] =
                        value!;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}