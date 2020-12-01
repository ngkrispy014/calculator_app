import 'package:calculator/constants.dart';
import 'package:calculator/provider/CalculatorNotifier.dart';
import 'package:calculator/ui/home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CalculatorNotifier>(
            create: (context) => CalculatorNotifier(),
          ),

        ],
        child: MaterialApp(
          title: 'Calculator',
          theme: ThemeData(
            primaryColor: kPrimaryColor,
          ),
          home: HomePage(),
        ));
  }
}
