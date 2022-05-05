import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobilecalculator/model/calculator_result.dart';
import 'package:mobilecalculator/calculator_button_row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorResult>(
      create: (context) => CalculatorResult(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    String displayValue = Provider.of<CalculatorResult>(context).numberString;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: const Color.fromRGBO(248, 248, 248, 1),
            height: 168,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(bottom: 20, right: 42),
            child: Text(
              displayValue,
              style: const TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: const <Widget>[
                CalculatorButtonsRow(
                  button1: "7",
                  button2: "8",
                  button3: "9",
                  button4: "×",
                ),
                CalculatorButtonsRow(
                  button1: "4",
                  button2: "5",
                  button3: "6",
                  button4: "÷",
                ),
                CalculatorButtonsRow(
                  button1: "1",
                  button2: "2",
                  button3: "3",
                  button4: "-",
                ),
                CalculatorButtonsRow(
                  button1: " ",
                  button2: "0",
                  button3: "=",
                  button4: "+",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
