import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Login.dart';

class Productscreen extends StatelessWidget {

  // ✅ Logout Function
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", false);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              logout(context);
            },
          )
        ],
      ),

      body: SingleChildScrollView( // ✅ prevents overflow
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [

              Container(
                color: Colors.blue.shade50,
                padding: EdgeInsets.all(8.00),
                child: Row(
                  children: [
                    CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/Amilmilk.jpg")),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Amul Milk",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("Price : 34"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                color: Colors.blue.shade50,
                padding: EdgeInsets.all(16.00),
                child: Row(
                  children: [
                    CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/Thumsup.jpg")),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Thums up",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("Price : 50"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                color: Colors.blue.shade50,
                padding: EdgeInsets.all(16.00),
                child: Row(
                  children: [
                    CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/Masala.jpg")), // ⚠️ fix image name
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Balaji Crunchex",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("Price : 10"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                color: Colors.blue.shade50,
                padding: EdgeInsets.all(16.00),
                child: Row(
                  children: [
                    CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/Darkfentasty.jpg")),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Darkfentasy",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("Price : 140"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              Container(
                color: Colors.blue.shade50,
                padding: EdgeInsets.all(16.00),
                child: Row(
                  children: [
                    CircleAvatar(radius: 40, backgroundImage: AssetImage("assets/Dairymilk.jpg")),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dairy Milk",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                          Text("Price : 10"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}