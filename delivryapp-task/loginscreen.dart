import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Homescreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  final formkey = GlobalKey<FormState>();

  late SharedPreferences sharedPreferences;

  bool isloading = true;

  @override
  void initState() {
    super.initState();
    checkvalue();
  }

  checkvalue() async {

    sharedPreferences = await SharedPreferences.getInstance();

    bool newuser = sharedPreferences.getBool("jay") ?? false;

    if (newuser == true) {

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Homescreen(),
        ),
      );

    } else {

      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    if (isloading) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(

      appBar: AppBar(
        title: Text("Login Form"),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),

          child: Form(
            key: formkey,

            child: Column(
              children: [

                SizedBox(height: 10),

                TextFormField(

                  controller: emailcontroller,

                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    border: OutlineInputBorder(),
                  ),

                  validator: (value) {

                    if (emailcontroller.text.isEmpty) {
                      return "Please Enter Email";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(

                  controller: passcontroller,

                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    border: OutlineInputBorder(),
                  ),

                  obscureText: true,

                  validator: (value) {

                    if (passcontroller.text.isEmpty) {
                      return "Please Enter Password";
                    }

                    return null;
                  },
                ),

                SizedBox(height: 10),

                ElevatedButton(

                  onPressed: () async {

                    if (formkey.currentState!.validate()) {

                      String e = emailcontroller.text.trim();
                      String p = passcontroller.text.trim();

                      if (e == "a@gmail.com" && p == "1234") {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login Success")),
                        );

                        await sharedPreferences.setBool("jay", true);

                        await sharedPreferences.setString("myemail", e);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Homescreen(),
                          ),
                        );

                      } else {

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login Fail")),
                        );
                      }
                    }
                  },

                  child: Text("Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}