import 'package:flutter/material.dart';
import 'package:flutter_calc/ui/widgets/CalculatorKey.dart';

class KeyPad extends StatelessWidget {
  static const Map<String, Color> colors = {
    "whiteLight": Color.fromARGB(100, 138, 138, 138),
    "whiteDark": Color.fromARGB(41, 138, 138, 138),
    "brownLight": Color.fromARGB(153, 167, 148, 148),
    "brownDark": Color.fromARGB(192, 160, 149, 149),
    "brownDarker": Color.fromARGB(255, 152, 141, 141),
  };

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: <Widget>[
          CalculatorKey(symbol: 'C', color: colors["whiteLight"]),
          CalculatorKey(symbol: '÷', color: colors["whiteLight"]),
          CalculatorKey(symbol: 'x', color: colors["whiteLight"]),
          CalculatorKey(symbol: 'arrow', color: colors["brownLight"]),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
      Row(
        children: <Widget>[
          CalculatorKey(symbol: '7', color: colors["whiteDark"]),
          CalculatorKey(symbol: '8', color: colors["whiteDark"]),
          CalculatorKey(symbol: '9', color: colors["whiteDark"]),
          CalculatorKey(symbol: '-', color: colors["brownDark"])
        ],
      ),
      Row(
        children: <Widget>[
          CalculatorKey(symbol: '4', color: colors["whiteLight"]),
          CalculatorKey(symbol: '5', color: colors["whiteLight"]),
          CalculatorKey(symbol: '6', color: colors["whiteLight"]),
          CalculatorKey(symbol: '+', color: colors["brownLight"]),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
      Row(
        children: <Widget>[
          CalculatorKey(symbol: '1', color: colors["whiteDark"]),
          CalculatorKey(symbol: '2', color: colors["whiteDark"]),
          CalculatorKey(symbol: '3', color: colors["whiteDark"]),
          CalculatorKey(symbol: '( )', color: colors["brownDark"]),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
      Row(
        children: <Widget>[
          CalculatorKey(symbol: '0', color: colors["whiteLight"]),
          CalculatorKey(symbol: ".", color: colors["whiteLight"]),
          CalculatorKey(symbol: '+/-', color: colors["whiteLight"]),
          CalculatorKey(symbol: '=', color: colors["brownDarker"]),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      )
    ]);
  }
}
