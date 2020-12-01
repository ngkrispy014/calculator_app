import 'package:calculator/ui/home/widgets/CalculatorButton.dart';
import 'package:flutter/material.dart';

class CalculatorRow extends StatelessWidget {
  final List<String> symbols;

  const CalculatorRow({Key key, @required this.symbols})
      : assert(symbols != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          ...symbols
              .map((symbol) =>
              CalculatorButton(
                symbol: symbol,
              ))
        ],
      ),
    );
  }
}