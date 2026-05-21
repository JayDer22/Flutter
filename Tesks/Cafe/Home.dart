import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'billscreen.dart';
import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;

  late SharedPreferences sharedPreferences;

  TextEditingController tableController = TextEditingController();

  var one = false;
  var two = false;
  var three = false;
  var four = false;
  var five = false;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void initPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        counter++;

        if (counter == 1) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Press back again to exit"),
              duration: Duration(seconds: 2),
            ),
          );

          Future.delayed(const Duration(seconds: 2), () {
            counter = 0;
          });

          return false;
        }

        return true;
      },

      child: Scaffold(
        appBar: AppBar(
          title: Text("Welcome"),

          leading: IconButton(
            onPressed: () async {
              SharedPreferences prefs =
              await SharedPreferences.getInstance();

              prefs.clear();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const FormEx(),
                ),
              );
            },

            icon: const Icon(Icons.logout),
          ),
        ),

        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),

                TextField(
                  controller: tableController,

                  decoration: InputDecoration(
                    hintText: "Enter your table number",
                    labelText: "Table Number",

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                // Pizza Container
                Stack(
                  clipBehavior: Clip.none,

                  children: [
                    Container(
                      height: 80,
                      width: 400,
                      margin: const EdgeInsets.only(left: 40),
                      color: Colors.teal,

                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50),

                            child: Text(
                              "Pizza \n Price : 149 rupees",

                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          Checkbox(
                            value: one,

                            onChanged: (value) {
                              setState(() {
                                this.one = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    const Positioned(
                      left: 0,
                      top: 10,

                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.orange,

                        child: Icon(
                          Icons.local_pizza,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Burger Container
                Stack(
                  clipBehavior: Clip.none,

                  children: [
                    Container(
                      height: 80,
                      width: 400,
                      margin: const EdgeInsets.only(left: 40),
                      color: Colors.teal,

                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50),

                            child: Text(
                              "Burger \n Price : 59 rupees",

                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          Checkbox(
                            value: two,

                            onChanged: (value) {
                              setState(() {
                                this.two = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    const Positioned(
                      left: 0,
                      top: 10,

                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.orange,

                        child: Icon(
                          Icons.lunch_dining,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Cold Coffee Container
                Stack(
                  clipBehavior: Clip.none,

                  children: [
                    Container(
                      height: 80,
                      width: 400,
                      margin: const EdgeInsets.only(left: 40),
                      color: Colors.teal,

                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50),

                            child: Text(
                              "Cold Coffee \n Price : 30 rupees",

                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          Checkbox(
                            value: three,

                            onChanged: (value) {
                              setState(() {
                                this.three = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    const Positioned(
                      left: 0,
                      top: 10,

                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.orange,

                        child: Icon(
                          Icons.coffee,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // French Fries Container
                Stack(
                  clipBehavior: Clip.none,

                  children: [
                    Container(
                      height: 80,
                      width: 400,
                      margin: const EdgeInsets.only(left: 40),
                      color: Colors.teal,

                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50),

                            child: Text(
                              "French Fries \n Price : 50 rupees",

                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          Checkbox(
                            value: four,

                            onChanged: (value) {
                              setState(() {
                                this.four = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    const Positioned(
                      left: 0,
                      top: 10,

                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.orange,

                        child: Icon(
                          Icons.fastfood,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                // Chocolate Cake Container
                Stack(
                  clipBehavior: Clip.none,

                  children: [
                    Container(
                      height: 80,
                      width: 400,
                      margin: const EdgeInsets.only(left: 40),
                      color: Colors.teal,

                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 50),

                            child: Text(
                              "Chocolote Cake \n Price : 100 rupees",

                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 20,
                              ),
                            ),
                          ),

                          Checkbox(
                            value: five,

                            onChanged: (value) {
                              setState(() {
                                this.five = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    const Positioned(
                      left: 0,
                      top: 10,

                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.orange,

                        child: Icon(
                          Icons.cake,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    List<String> items = [];

                    int total = 0;

                    if (one == true) {
                      items.add("Pizza - 149");
                      total += 149;
                    }

                    if (two == true) {
                      items.add("Burger - 59");
                      total += 59;
                    }

                    if (three == true) {
                      items.add("Cold Coffee - 30");
                      total += 30;
                    }

                    if (four == true) {
                      items.add("French Frise - 50");
                      total += 50;
                    }

                    if (five == true) {
                      items.add("Chocolote Cake - 100");
                      total += 100;
                    }

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) => Billscreen(
                          tableNo: tableController.text,
                          items: items,
                          total: total,
                        ),
                      ),
                    );
                  },

                  child: const Text("Order"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}