import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled6/cafe/Home.dart';

class FormEx extends StatefulWidget {
  const FormEx({super.key});

  @override
  State<FormEx> createState() => _FormExState();
}

class _FormExState extends State<FormEx> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passcontroller = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  late SharedPreferences sharedPreferences;

  bool newuser = true;

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  // Initialize SharedPreferences
  Future<void> initPrefs() async {
    sharedPreferences = await SharedPreferences.getInstance();

    // Wait until widget is built before navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkvalue();
    });
  }

  // Check login status
  void checkvalue() {
    newuser = sharedPreferences.getBool("tops") ?? true;

    if (newuser == false) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    }
  }

  // Login Function
  void login() {
    if (formkey.currentState!.validate()) {
      String e = emailcontroller.text.trim();
      String p = passcontroller.text.trim();

      if (e == "a@gmail.com" && p == "1234") {
        // Save login status
        sharedPreferences.setBool("tops", false);
        sharedPreferences.setString("myemail", e);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Success"),
          ),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Invalid Email or Password"),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    emailcontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Form"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),

                  // Email Field
                  TextFormField(
                    controller: emailcontroller,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Enter Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Email";
                      }

                      if (!value.contains("@")) {
                        return "Enter Valid Email";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 15),

                  // Password Field
                  TextFormField(
                    controller: passcontroller,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Enter Password",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Password";
                      }

                      if (value.length < 4) {
                        return "Password too short";
                      }

                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: login,
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}