import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Page"),
      ),

      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,

            children: [
              // Background
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.blue,
              ),


              Positioned(
                bottom: -50,
                left: MediaQuery.of(context).size.width / 2 - 50,

                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                    "assets/img.png",
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 60),


          Text(
            "Jay Der",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 10),


          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),

            child: Text(
              "Flutter Developer | UI Designer | Mobile App",
              textAlign: TextAlign.center,

              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}