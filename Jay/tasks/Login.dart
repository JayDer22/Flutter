import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Product_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late SharedPreferences sharedPreferences;
  String message = "";

  @override
  void initState() {
    super.initState();
    checkValue();
  }

  Future<void> checkValue() async {
    sharedPreferences = await SharedPreferences.getInstance();

    bool isLoggedIn = sharedPreferences.getBool("isLoggedIn") ?? false;

    if (isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Productscreen()),
      );
    }
  }

  bool isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  Future<void> login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text;

    if (!isValidEmail(email)) {
      setState(() {
        message = "Enter a valid email";
      });
      return;
    }

    if (email == "admin@gmail.com" && password == "1234") {
      sharedPreferences = await SharedPreferences.getInstance();

      await sharedPreferences.setBool("isLoggedIn", true);
      await sharedPreferences.setString("myemail", email);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login success")));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Productscreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login fail")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),

      body: Center(
        child: SingleChildScrollView(
            child: Container(
              width: 320,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),


                gradient: LinearGradient(
                  colors: [Colors.pinkAccent, Colors.purpleAccent],
                ),


                boxShadow: [
                  BoxShadow(
                    color: Colors.pinkAccent.withOpacity(0.6),
                    blurRadius: 15,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    color: Colors.purpleAccent.withOpacity(0.5),
                    blurRadius: 30,
                    spreadRadius: 5,
                  ),
                ],
              ),


              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 20),

                    TextField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "Email",
                        hintText: "Enter Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    SizedBox(height: 15),

                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("Login"),
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(message, style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
