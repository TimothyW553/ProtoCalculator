import 'package:flutter/material.dart';
import 'package:mobilecalculator/model/calculator_result.dart';
import 'package:provider/provider.dart';

class CalculatorButton extends StatelessWidget {
  final String text;

  const CalculatorButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ButtonTheme(
        height: double.infinity,
        child: SizedBox(
          height: double.infinity,
          child: TextButton(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 37.0,
                color: Colors.black,
              ),
            ),
            onPressed: () {
              handlePress(text, context);
            },
          ),
        ),
      ),
    );
  }

  void handlePress(String title, BuildContext context) {
    var calculator = context.read<CalculatorResult>();

    final numberString = calculator.numberString;
    final calculate = calculator.shouldCalculate;

    if (title == "+" || title == "-" || title == "×" || title == "÷") {
      // use type enum or classes
      if (calculate) {
        // if we should calculate
        calculator.calculateValue();
      } else {
        calculator.result = double.parse(numberString);
        calculator.calculate = true;
      }
      calculator.numberString = "0";
      calculator.operation = title;
    } else if (title == "=") {
      calculator.calculateValue();
      calculator.calculate = false;
    } else {
      // a number
      if (numberString == "0") {
        calculator.numberString = "";
      }
      calculator.numberString += title;
      calculator.displayString = numberString;
    }
  }
}
