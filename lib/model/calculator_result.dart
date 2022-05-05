import 'package:flutter/material.dart';

class CalculatorResult with ChangeNotifier {
  /// "intermediate" result of calculation
  String _numberString = "0";

  /// Number to be displayed on the screen as a string
  String _displayString = "0";

  /// Type of operation
  String _operation = "";

  /// Double result to perform calculations on
  double _result = 0.0;
  bool _calculate = false;

  /// Getters
  String get numberString => _numberString;
  String get displayString => _displayString;
  String get operation => _operation;
  double get result => _result;
  bool get calculate => _calculate;

  /// Setters
  set numberString(String value) {
    _numberString = value;
    notifyListeners();
  }

  set displayString(String value) {
    _displayString = value;
    notifyListeners();
  }

  set operation(String op) {
    _operation = op;
    notifyListeners();
  }

  set result(double value) {
    _result = value;
    notifyListeners();
  }

  set calculate(bool value) {
    _calculate = value;
    notifyListeners();
  }

  void calculateValue() {
    switch (_operation) {
      case '+':
        _result += double.parse(_numberString);
        break;
      case '-':
        _result -= double.parse(_numberString);
        break;
      case '×':
        _result *= double.parse(_numberString);
        break;
      case '÷':
        _result /= double.parse(_numberString);
        break;
      default:
        break;
    }
    _numberString = _result.toString();
    _displayString = _numberString;
    notifyListeners();
  }
}
