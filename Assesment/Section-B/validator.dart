import 'package:flutter/material.dart';

class Validator extends StatefulWidget {
  const Validator({super.key});

  @override
  State<Validator> createState() => _ValidatorState();
}

class _ValidatorState extends State<Validator> {

  
  final _formKey = GlobalKey<FormState>();


  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();


  String weight = "";
  String height = "";

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Validator",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Form(
          key: _formKey,

          child: Column(

            children: [


              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.only(bottom: 20),

                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundImage:
                      AssetImage("assets/profile.jpg"),
                    ),

                    const SizedBox(width: 20),


                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          "Weight: $weight",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          "Height: $height",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),


              TextFormField(

                controller: weightController,
                keyboardType: TextInputType.number,

                decoration: const InputDecoration(
                  labelText: "Enter Weight",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter weight";
                  }

                  double? number = double.tryParse(value);

                  if (number == null) {
                    return "Please enter valid number";
                  }

                  if (number < 0) {
                    return "Value cannot be negative";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              TextFormField(

                controller: heightController,
                keyboardType: TextInputType.number,

                decoration: const InputDecoration(
                  labelText: "Enter Height",
                  border: OutlineInputBorder(),
                ),

                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Please enter Height";
                  }

                  double? number = double.tryParse(value);

                  if (number == null) {
                    return "Please enter valid number";
                  }

                  if (number < 0) {
                    return "Value cannot be negative";
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),


              ElevatedButton(

                onPressed: () {


                  if (_formKey.currentState!.validate()) {

                    setState(() {

                      weight = weightController.text;
                      height = heightController.text;

                    });
                  }
                },

                child: const Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}