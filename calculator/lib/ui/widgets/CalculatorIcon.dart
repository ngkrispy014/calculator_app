import 'package:flutter/material.dart';

class CalculatorIcon extends StatelessWidget {
  final IconData baseIcon;
  const CalculatorIcon({Key key,@required this.baseIcon}):assert(baseIcon != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(baseIcon,size: 30,);
  }
}
