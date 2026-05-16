import 'package:flutter/material.dart';




class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {


  TextEditingController taskController = TextEditingController();


  List<String> tasks = [];


  void addTask() {


    if (taskController.text.isNotEmpty) {

      setState(() {


        tasks.add(taskController.text);

      });


      taskController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("To-Do List App"),
      ),

      body: Column(
        children: [


          Padding(
            padding: EdgeInsets.all(10),

            child: TextField(
              controller: taskController,

              decoration: InputDecoration(
                hintText: "Enter Task",
                border: OutlineInputBorder(),
              ),
            ),
          ),


          ElevatedButton(
            onPressed: addTask,
            child: Text("Add Task"),
          ),

          SizedBox(height: 10),

          Expanded(
            child: ListView.builder(

              itemCount: tasks.length,

              itemBuilder: (context, index) {

                return Dismissible(


                  key: Key(tasks[index]),


                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),

                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),


                  onDismissed: (direction) {

                    setState(() {

                      tasks.removeAt(index);

                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Task Deleted"),
                      ),
                    );
                  },


                  child: Card(
                    child: ListTile(
                      title: Text(tasks[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}