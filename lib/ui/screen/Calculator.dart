import 'package:flutter/material.dart';
import 'package:flutter_calc/ui/widgets/KeyPad.dart';
import 'package:flutter_calc/ui/widgets/VariableKey.dart';
import 'package:flutter_calc/KeyController.dart';
import 'package:flutter_calc/Processor.dart';

class Calculator extends StatefulWidget {
  Calculator({Key key}) : super(key: key);

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  bool _visible = true;
  var _iconArrow = Icons.keyboard_arrow_down;
  String _output;
  @override
  void initState() {
    KeyController.listen((event) => Processor.process(event));
    Processor.listen((data) => setState(() {
          _output = data;
        }));
    Processor.refresh();
    super.initState();
  }

  @override
  void dispose() {
    KeyController.dispose();
    Processor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 160, 149, 149),
              child: Center(
                child: Text(_output,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 72)),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _visible = !_visible;
                if (!_visible)
                  _iconArrow = Icons.keyboard_arrow_up;
                else
                  _iconArrow = Icons.keyboard_arrow_down;
              });
            },
            child: Container(
              height: 35,
              color: Color.fromARGB(255, 152, 141, 141),
              child: Center(
                child: Icon(_iconArrow, size: 40, color: Colors.white),
              ),
            ),
          ),
          _visible
              ? Row(
                  children: <Widget>[
                    Expanded(
                      child: VariableKey(title: 'V1', value: '2'),
                    ),
                    VariableKey(title: 'V2', value: '23.5'),
                    VariableKey(title: 'V3', value: '-'),
                    VariableKey(title: 'V4', value: '15'),
                  ],
                )
              : SizedBox(),
          KeyPad(),
        ],
      ),
    );
  }
}
