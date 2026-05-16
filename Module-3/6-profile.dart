import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
        Text("Profile"),
      ),
body: Column(
  children: [
    SizedBox(child: Center(
        child: Container(
          height: 100,
          width: 700,
          color: Colors.teal,
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("img.png"),

              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [

                    Text("Jay Der",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.yellow,),),
                    Text("Flutter Developer",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.yellow),),
                  ],
                ),
              )

            ],
          ),
        )
    ),)

  ],
),
    );
  }
}
