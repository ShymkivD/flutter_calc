import 'dart:async';
import 'package:flutter_calc/ui/widgets/CalculatorKey.dart';
import 'package:flutter_calc/KeyController.dart';

abstract class Processor {
  static String _operator;
  static String _valA = '0';
  static String _valB = '0';
  static String _result;

  static List<String> _functions = ['C', '+/-', '( )', 'arrow'];
  static List<String> _operators = ['÷', 'x', '-', '+', '='];

  static StreamController _controller = StreamController();
  static Stream get _stream => _controller.stream;

  static StreamSubscription listen(Function handler) => _stream.listen(handler);
  static void refresh() => _fire(_output);

  static void _fire(String data) => _controller.add(_output);

  static String get _output => _result == null ? _equation : _result;

  static String get _equation =>
      _valA +
      (_operator != null ? ' ' + _operator : '') +
      (_valB != '0' ? ' ' + _valB : '');

  static dispose() => _controller.close();

  static process(dynamic event) {
    CalculatorKey key = (event as KeyEvent).key;
    if (_functions.contains(key.symbol))
      return handleFunction(key);
    else if (_operators.contains(key.symbol))
      return handleOperator(key);
    else
      return handleInteger(key);
  }

  static void handleFunction(CalculatorKey key) {
    if (_valA == '0') {
      return;
    }
    if (_result != null) {
      _condense();
    }

    Map<String, dynamic> table = {
      'C': () => _clear(),
      '+/-': () => _sign(),
//      '( )': () => (),
      'arrow': () => _removeChar(),
    };

    table[key.symbol]();
    refresh();
  }

  static void handleOperator(CalculatorKey key) {
    if (_valA == '0') {
      return;
    }
    if (key.symbol == '=') {
      return _calculate();
    }
    if (_result != null) {
      _condense();
    }

    _operator = key.symbol;
    refresh();
  }

  static void handleInteger(CalculatorKey key) {
    String val = key.symbol;
    if (_operator == null) {
      _valA = (_valA == '0') ? val : _valA + val;
    } else {
      _valB = (_valB == '0') ? val : _valB + val;
    }
    refresh();
  }

  static void _clear() {
    _valA = _valB = '0';
    _operator = _result = null;
  }

  static void _sign() {
    if (_valB != '0') {
      _valB = (_valB.contains('-') ? _valB.substring(1) : '-' + _valB);
    } else if (_valA != '0') {
      _valA = (_valA.contains('-') ? _valA.substring(1) : '-' + _valA);
    }
  }

  static void _removeChar() {
    _result = _output.substring(0, _output.length - 1);
//    refresh();
  }

  static void _calculate() {
    if (_operator == null || _valB == '0') {
      return;
    }

    Map<String, dynamic> table = {
      '÷': (a, b) => (a / b),
      'x': (a, b) => (a * b),
      '-': (a, b) => (a - b),
      '+': (a, b) => (a + b)
    };

    double result = table[_operator](double.parse(_valA), double.parse(_valB));
    String str = result.toString();

    while ((str.contains('.') && str.endsWith('0')) || str.endsWith('.')) {
      str = str.substring(0, str.length - 1);
    }

    _result = str;
    refresh();
  }

  static void _condense() {
    _valA = _result;
    _valB = '0';
    _result = _operator = null;
  }
}
