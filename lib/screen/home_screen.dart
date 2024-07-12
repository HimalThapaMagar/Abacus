// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_abacus/calculator_brain/brain.dart';
import 'package:project_abacus/constants/color.dart';
import 'package:project_abacus/reusable_Widgets/calc_button.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  CalculatorBrain _calculatorBrain = CalculatorBrain();
  String input = "";
  String output = "";
  bool hasError = false;

  void onButtonClick(String value) {
  setState(() {
    if (value == "AC") {
      input = "";
      output = "";
      hasError = false; // Reset error state
    } else if (value == "<") {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
        hasError = false; // Reset error state
      }
    } else if (value == "=") {
      if (!hasError) {
        output = _calculatorBrain.calculate(input);
      } else {
        output = "Error"; // Show error message in output
      }
      hasError = false; // Reset error state
    } else {
      // Check for consecutive operators
      if (value == "+" || value == "-" || value == "*" || value == "/") {
        if (input.isEmpty || "+-*/".contains(input[input.length - 1])) {
          hasError = true;
          return;
        }
      }
      input += value;
      hasError = false; // Reset error state
    }
  });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text(
            "ABACUS",
            style: GoogleFonts.itim(
              textStyle: TextStyle(
                color: black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: white,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(padding: EdgeInsets.all(10.0)),
                    Text(
                      input,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: black,
                        fontSize: 40,
                      ),
                    ),
                    Text(
                      output,
                      style: TextStyle(
                        color: hasError? Colors.red : black,
                        fontSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                color: black,
                height: 10,
                thickness: 2,
                indent: 25,
                endIndent: 25,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numberButton('AC', accentColor, onButtonClick),
                  numberButton('<', accentColor, onButtonClick),
                  numberButton('/', accentColor, onButtonClick),
                  numberButton('x', accentColor, onButtonClick),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              //
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numberButton('1', black, onButtonClick),
                  numberButton('2', black, onButtonClick),
                  numberButton('3', black, onButtonClick),
                  numberButton('-', accentColor, onButtonClick),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numberButton('4', black, onButtonClick),
                  numberButton('5', black, onButtonClick),
                  numberButton('6', black, onButtonClick),
                  numberButton('+', accentColor, onButtonClick),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButton("7", black, onButtonClick),
                      numberButton("00", black, onButtonClick),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButton("8", black, onButtonClick),
                      numberButton("0", black, onButtonClick),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      numberButton("9", black, onButtonClick),
                      numberButton(".", black, onButtonClick),
                    ],
                  ),
                  numberButton("=", accentColor, onButtonClick),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}




