import 'package:flutter/material.dart';
import 'package:mobilecalculator/calculator_button.dart';

class CalculatorButtonsRow extends StatelessWidget {
  final String button1;
  final String button2;
  final String button3;
  final String button4;

  const CalculatorButtonsRow(
      {Key? key,
      required this.button1,
      required this.button2,
      required this.button3,
      required this.button4})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          CalculatorButton(
            text: button1,
          ),
          CalculatorButton(
            text: button2,
          ),
          CalculatorButton(
            text: button3,
          ),
          CalculatorButton(
            text: button4,
          ),
        ],
      ),
    );
  }
}
