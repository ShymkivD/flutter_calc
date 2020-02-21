import 'package:flutter/material.dart';
import 'package:flutter_calc/KeyController.dart';

class CalculatorKey extends StatelessWidget {
  CalculatorKey({this.symbol, this.color});

  final String symbol;
  final Color color;

  static dynamic _fire(CalculatorKey key) => KeyController.fire(KeyEvent(key));

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
//        width: 90,
//        height: 65,
          color: color,
          child: MaterialButton(
            child: symbol == 'arrow'
                ? Icon(Icons.keyboard_backspace,
                    color: Color.fromARGB(255, 244, 235, 229))
                : Text(symbol,
                    style: TextStyle(
                        color: color.alpha >= 120
                            ? Color.fromARGB(255, 244, 235, 229)
                            : Color.fromARGB(62, 0, 0, 0),
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
            onPressed: () => _fire(this),
            splashColor: Colors.black12,
          )),
    );
  }
}
