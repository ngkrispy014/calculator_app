import 'package:flutter/material.dart';

class CalculatorText extends StatelessWidget {
  final String baseText;

  const CalculatorText({Key key, this.baseText}) :assert(baseText !=null), super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      baseText,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold
      ),
    );
  }
}
