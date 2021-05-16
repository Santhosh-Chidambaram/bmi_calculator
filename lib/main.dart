import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'constants.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: backgroundColor,
          scaffoldBackgroundColor: backgroundColor,
          textTheme: TextTheme(body1: TextStyle(color: Colors.white))),
      home: HomePage(),
    ));
  }
}
