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
    String numberString =
        Provider.of<CalculatorResult>(context, listen: false).numberString;
    bool calculate =
        Provider.of<CalculatorResult>(context, listen: false).calculate;

    if (title == "+" || title == "-" || title == "×" || title == "÷") {
      if (calculate) {
        // if we should calculate
        Provider.of<CalculatorResult>(context, listen: false).calculateValue();
      } else {
        Provider.of<CalculatorResult>(context, listen: false).result =
            double.parse(numberString);
        Provider.of<CalculatorResult>(context, listen: false).calculate = true;
      }
      Provider.of<CalculatorResult>(context, listen: false).numberString = "";
      Provider.of<CalculatorResult>(context, listen: false).operation = title;
    } else if (title == "=") {
      Provider.of<CalculatorResult>(context, listen: false).calculateValue();
      Provider.of<CalculatorResult>(context, listen: false).calculate = false;
    } else {
      // a number
      if (numberString == '0') {
        Provider.of<CalculatorResult>(context, listen: false).numberString = "";
      }
      Provider.of<CalculatorResult>(context, listen: false).numberString +=
          title;
      Provider.of<CalculatorResult>(context, listen: false).displayString =
          numberString;
    }
  }
}
