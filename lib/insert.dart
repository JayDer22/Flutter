import 'package:flutter/material.dart';
import 'package:untitled8/db.dart';
import 'package:untitled8/view.dart';

class form1 extends StatefulWidget {
  const form1({super.key});

  @override
  State<form1> createState() => _form1State();
}

class _form1State extends State<form1> {
  Mydb db = Mydb();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    super.initState();
    openDB();
  }

  Future<void> openDB() async {
    await db.open();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400,
            width: 500,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),

                TextFormField(
                  controller: name,
                  decoration: InputDecoration(
                    labelText: "Enter Name1",
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    prefixIcon: const Icon(Icons.email),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                TextFormField(
                  controller: phone,
                  decoration: InputDecoration(
                    labelText: "Enter Phone",
                    prefixIcon: const Icon(Icons.phone),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                ElevatedButton(
                  onPressed: () async {
                    await db.db.rawInsert(
                      "INSERT INTO students(name,email,phone) VALUES(?,?,?)",
                      [
                        name.text,
                        email.text,
                        phone.text,
                      ],
                    );

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MyApp(),
                      ),
                    );
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}