import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login>
{

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Form")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(height: 10,),
                TextFormField(controller:emailcontroller,decoration: InputDecoration(hintText: "Enter Email",border: OutlineInputBorder()),validator:(value)
                {
                  if(emailcontroller.text.isEmpty)
                  {
                    return "Please Enter Email";
                  }
                },),
                SizedBox(height: 10,),
                TextFormField(controller:passcontroller,decoration: InputDecoration(hintText: "Enter Password",border: OutlineInputBorder()),obscureText: true,
                    validator:(value) {
                      if (passcontroller.text.isEmpty) {
                        return "Please Enter Password";
                      }
                    }
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: ()
                {
                  if(formkey.currentState!.validate())
                  {
                    String e = emailcontroller.text.toString();
                    String p = passcontroller.text.toString();

                    if(e=="a@gmail.com" && p=="1234")
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Success")));
                      //print("Success");
                    }
                    else
                    {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Fail")));

                      //print("Fail");
                    }

                  }



                }, child: Text("Login")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}