import 'package:flutter/material.dart';
import 'package:untitled8/db.dart';
import 'package:untitled8/view.dart';

class Update extends StatefulWidget {
  final String name;
  final String email;

  const Update({
    super.key,
    required this.name,
    required this.email,
  });

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  Mydb db = Mydb();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void initState() {
    super.initState();
    initDB();
  }

  Future<void> initDB() async {
    await db.open();

    name.text = widget.name;
    email.text = widget.email;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: name,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),

            const SizedBox(height: 20),

            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () async {
                await db.db.rawUpdate(
                  "UPDATE students SET name=?, email=? WHERE email=?",
                  [
                    name.text,
                    email.text,
                    widget.email,
                  ],
                );

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const MyApp(),
                  ),
                );
              },
              child: const Text("Update1"),
            ),
          ],
        ),
      ),
    );
  }
}