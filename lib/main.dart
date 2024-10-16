import 'package:flutter/material.dart';

import 'presentation/pages/user_input_page.dart';

void main() {
  runApp(const CalorieCalculatorApp());
}

class CalorieCalculatorApp extends StatelessWidget {
  const CalorieCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Calculator',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const UserInputScreen(),
    );
  }
}
