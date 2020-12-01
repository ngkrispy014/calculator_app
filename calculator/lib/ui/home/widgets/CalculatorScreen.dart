import 'package:calculator/ui/home/widgets/CalculatorRow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/provider/CalculatorNotifier.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Consumer<CalculatorNotifier>(
                    builder: (context, _calculatorProvider, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Flexible(
                            child: Text(
                              _calculatorProvider.displayNum,
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                fontSize: 40.0,
                              ),
                            ),
                          ),
                          if (_calculatorProvider.displaySymbol)
                            _calculatorProvider.handleSymbol() ??
                                SizedBox.shrink(),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: <Widget>[
                  CalculatorRow(symbols: ['9', '8', '7', '+']),
                  CalculatorRow(symbols: ['6', '5', '4', '-']),
                  CalculatorRow(symbols: ['3', '2', '1', '*']),
                  CalculatorRow(symbols: ['CE', '0', '=', '/']),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}