import 'package:flutter/material.dart';
import 'package:untitled8/db.dart';
import 'package:untitled8/update.dart';
import 'insert.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Mydb db = Mydb();
  List<Map<String, dynamic>> slist = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await db.open();

    slist = await db.db.rawQuery(
      'SELECT * FROM students',
    );

    setState(() {});
  }

  Future<void> deleteData(String email) async {
    await db.db.rawDelete(
      "DELETE FROM students WHERE email=?",
      [email],
    );

    await loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Data"),
      ),
      body: slist.isEmpty
          ? const Center(
        child: Text("No Data Found"),
      )
          : ListView.builder(
        itemCount: slist.length,
        itemBuilder: (context, index) {
          var data = slist[index];

          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(data["name"]),
              subtitle: Text(
                "${data["email"]}\n${data["phone"]}",
              ),
              trailing: Wrap(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Update(
                            name: data["name"],
                            email: data["email"],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () async {
                      await deleteData(data["email"]);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const form1(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}