import 'package:flutter/material.dart';

class Drawer1 extends StatefulWidget {
  const Drawer1({super.key});

  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  @override
  Widget build(BuildContext context) {
    return Container
    (
        child: Drawer(
          child: Column(
            children: [
              ListTile(
                title: Text("Add category"),
                trailing: Icon(Icons.add_box_outlined,color: Colors.teal,),
              ),
              Divider(
                thickness: 2,
                color: Colors.teal,
              ),
              ListTile(
                title: Text("Home"),
                trailing: Icon(Icons.home),
              ),
              Divider(
                thickness: 2,
                color: Colors.teal,
              ),
              ListTile(
                title: Text("About"),
                trailing: Icon(Icons.info),
              ),
            ],
          ),
        ),
    );
  }
}
