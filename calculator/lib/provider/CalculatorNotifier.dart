import 'package:calculator/ui/widgets/CalculatorIcon.dart';
import 'package:calculator/ui/widgets/CalculatorText.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CalculatorNotifier with ChangeNotifier {
  String _displayNum = '0';
  String _calcNum = '';
  String _operationSymbol = '';
  double _result;
  bool _displaySymbol = false;
  bool _shouldCalculate = false;

  String get displayNum => _displayNum;
  bool get displaySymbol => _displaySymbol;

  Widget calcButtonWidget(String symbol) {
    switch (symbol) {
      case '+':
        return CalculatorIcon(baseIcon: FontAwesomeIcons.plus);
      case '-':
        return CalculatorIcon(baseIcon: FontAwesomeIcons.minus);
      case '*':
        return CalculatorIcon(baseIcon: FontAwesomeIcons.times);
      case '/':
        return CalculatorIcon(baseIcon: FontAwesomeIcons.divide);
      case '=':
        return CalculatorIcon(baseIcon: FontAwesomeIcons.equals);
      default:
        return CalculatorText(baseText: symbol);
    }
  }

  CalculatorIcon handleSymbol() {
    switch (_operationSymbol) {
      case '+':
        return CalculatorIcon(baseIcon: FontAwesomeIcons.plus);
      case '-':
        return CalculatorIcon(baseIcon: FontAwesomeIcons.minus);
      case '*':
        return CalculatorIcon(baseIcon: FontAwesomeIcons.times);
      case '/':
        return CalculatorIcon(baseIcon: FontAwesomeIcons.divide);
      default:
        return null;
    }
  }

  void pressButton(String selectedButtonSymbol) {
    switch (selectedButtonSymbol) {
      case '+':
      case '-':
      case '*':
      case '/':
        if (_shouldCalculate) {
          print(selectedButtonSymbol);
          _result = calculate(_result.toString(), _calcNum, _operationSymbol);
          _calcNum = _result.toString();
          _displayNum = _calcNum;
        } else {
          _result = double.tryParse(_calcNum) ?? 0;
          _shouldCalculate = true;
        }
        _calcNum = '';
        _operationSymbol = selectedButtonSymbol;
        _displaySymbol = true;
        break;
      case '=':
        _result = calculate(_result.toString(), _calcNum, _operationSymbol);
        _calcNum = _result.toString();
        _displayNum = _calcNum;
        _operationSymbol = '';
        _shouldCalculate = false;
        break;
      case 'CE':
        _calcNum = '';
        _displayNum = '0';
        _operationSymbol = '';
        _result = 0;
        _shouldCalculate = false;
        _displaySymbol = false;
        break;
      default:
        _calcNum += selectedButtonSymbol;
        _displayNum = _calcNum;
        _displaySymbol = false;
    }
    notifyListeners();
  }

  double calculate(String num1, String num2, String operationalSymbol) {
    double result = 0.0;
    switch (operationalSymbol) {
      case '+':
        print(operationalSymbol);
        return (result = double.tryParse(num1) + double.tryParse(num2));
        break;
      case '-':
        return (result = double.tryParse(num1) - double.tryParse(num2));
        break;
      case '*':
        return (result = double.tryParse(num1) * double.tryParse(num2));
        break;
      case '/':
        return (result = double.tryParse(num1) / double.tryParse(num2));
        break;
      default:
        break;
    }
    return result;
  }
}
