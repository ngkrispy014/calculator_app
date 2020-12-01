import 'package:calculator/provider/CalculatorNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorButton extends StatelessWidget {
  final String symbol;

  const CalculatorButton({
    Key key,
    @required this.symbol,
  })  : assert(symbol != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    CalculatorNotifier _calculatorProvider = Provider.of<CalculatorNotifier>(
      context,
      listen: false, // do not to listen here
    );
    return Expanded(
      child: ButtonTheme(
        height: double.infinity,
        child: OutlineButton(
          onPressed: () => _calculatorProvider.pressButton(symbol),
          child: _calculatorProvider.calcButtonWidget(symbol),
          splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          ),
          highlightedBorderColor:
          Theme.of(context).primaryColor.withOpacity(0.1),
        ),
      ),
    );
  }
}