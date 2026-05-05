import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Data extends StatefulWidget {
  const Data({super.key});

  @override
  dataState createState() => dataState();
}

class dataState extends State<Data> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  late SharedPreferences sharedPreferences;
  var newuser;
  @override
  void initState() {
    super.initState();
    checkvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login Form",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFormField(
                  controller: emailcontroller,
                  decoration: const InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passcontroller,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Password";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                ElevatedButton(onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    String e = emailcontroller.text;
                    String p = passcontroller.text;

                    if (e == "a@gmail.com" && p == "1234") {
                      final prefs = await SharedPreferences.getInstance();

                      await prefs.setBool("Jay", false);
                      await prefs.setString("Myemail", e);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Login Successfully",
                            style: TextStyle(color: Colors.green),
                          ),
                        ),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Login Fail",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    }
                  }
                }, child: Text("Login"),)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkvalue() async{
    sharedPreferences = await SharedPreferences.getInstance();
    newuser = sharedPreferences.getBool("Jay")??true;
    if(newuser==false)
    {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ()),
      );    }
  }
}


