import 'package:flutter/material.dart';

class Calculatorex extends StatefulWidget {
  const Calculatorex({super.key});

  @override
  State<Calculatorex> createState() => _CalculatorexState();
}

class _CalculatorexState extends State<Calculatorex> {

  String output = "0";

  void buttonPressed(String value) {

    setState(() {

      // Clear Button
      if (value == "C") {

        output = "0";
      }

      // Equal Button
      else if (value == "=") {

        try {

          String expression = output;

          // Replace symbols
          expression =
              expression.replaceAll("×", "*");

          expression =
              expression.replaceAll("÷", "/");

          String number = "";

          List<String> numbers = [];

          String operator = "";

          // Separate numbers and operator
          for (int i = 0;
          i < expression.length;
          i++) {

            String ch = expression[i];

            if ("+-*/".contains(ch)) {

              numbers.add(number);

              operator = ch;

              number = "";

            } else {

              number += ch;
            }
          }

          numbers.add(number);

          double num1 =
          double.parse(numbers[0]);

          double num2 =
          double.parse(numbers[1]);

          double result = 0;

          // Calculations
          if (operator == "+") {

            result = num1 + num2;
          }

          else if (operator == "-") {

            result = num1 - num2;
          }

          else if (operator == "*") {

            result = num1 * num2;
          }

          else if (operator == "/") {

            result = num1 / num2;
          }

          output = result.toString();

        } catch (e) {

          output = "Error";
        }
      }

      // Numbers and Operators
      else {

        if (output == "0") {

          output = value;

        } else {

          output = output + value;
        }
      }
    });
  }

  // Calculator Button
  Widget calculatorButton(String text,
      {Color color = Colors.white}) {

    return Expanded(

      child: Padding(

        padding: const EdgeInsets.all(8.0),

        child: ElevatedButton(

          style: ElevatedButton.styleFrom(

            backgroundColor: color,

            padding: const EdgeInsets.all(22),

            shape: RoundedRectangleBorder(

              borderRadius:
              BorderRadius.circular(15),
            ),
          ),

          onPressed: () {

            buttonPressed(text);
          },

          child: Text(

            text,

            style: TextStyle(

              fontSize: 28,
              fontWeight: FontWeight.bold,

              color:
              color == Colors.teal
                  ? Colors.white
                  : Colors.teal,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        backgroundColor: Colors.teal,

        title: const Text(
          "Calculator",

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: Column(

        children: [

          // Display Screen
          Expanded(

            child: Container(

              alignment: Alignment.bottomRight,

              padding: const EdgeInsets.all(25),

              child: Text(

                output,

                style: const TextStyle(

                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),
          ),

          // Buttons
          Column(

            children: [

              Row(
                children: [

                  calculatorButton(
                      "7"),

                  calculatorButton(
                      "8"),

                  calculatorButton(
                      "9"),

                  calculatorButton(
                      "/",
                      color: Colors.teal),
                ],
              ),

              Row(
                children: [

                  calculatorButton(
                      "4"),

                  calculatorButton(
                      "5"),

                  calculatorButton(
                      "6"),

                  calculatorButton(
                      "*",
                      color: Colors.teal),
                ],
              ),

              Row(
                children: [

                  calculatorButton(
                      "1"),

                  calculatorButton(
                      "2"),

                  calculatorButton(
                      "3"),

                  calculatorButton(
                      "-",
                      color: Colors.teal),
                ],
              ),

              Row(
                children: [

                  calculatorButton(
                      "0"),

                  calculatorButton(
                      "C",
                      color: Colors.red),

                  calculatorButton(
                      "=",
                      color: Colors.teal),

                  calculatorButton(
                      "+",
                      color: Colors.teal),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}