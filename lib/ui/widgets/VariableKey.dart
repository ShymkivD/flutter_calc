import 'package:flutter/material.dart';

class VariableKey extends StatefulWidget {
  VariableKey({Key key, this.title, this.value}) : super(key: key);
  final String title;
  final String value;
  @override
  _VariableKeyState createState() => _VariableKeyState();
}

class _VariableKeyState extends State<VariableKey> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(41, 0, 91, 228),
        child: MaterialButton(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.title,
                style: TextStyle(
                    color: Color.fromARGB(62, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
            Text(widget.value,
                style: TextStyle(
                    color: Color.fromARGB(115, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                    fontSize: 11))
          ],
        )));
  }
}
