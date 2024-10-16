import 'package:flutter/material.dart';

import '../widgets/card_calories_widget.dart';
import '../widgets/result_row_widget.dart';

class ResultScreen extends StatelessWidget {
  final double weight;
  final double height;
  final int age;
  final String gender;
  final String activityLevel;
  final String goal;
  final double calories;

  const ResultScreen({
    super.key,
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
    required this.activityLevel,
    required this.goal,
    required this.calories,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Resultado do Cálculo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CardCalorieWidget(
                title: 'Calorias Diárias Recomendadas',
                calories: '${calories.toStringAsFixed(2)} kcal'),
            const SizedBox(height: 20),
            ResultRowWidget(
                label: 'Peso:', value: '${weight.toStringAsFixed(1)} kg'),
            ResultRowWidget(
                label: 'Altura:', value: '${height.toStringAsFixed(1)} cm'),
            ResultRowWidget(label: 'Idade:', value: '$age anos'),
            ResultRowWidget(label: 'Gênero:', value: gender),
            ResultRowWidget(label: 'Nível de Atividade:', value: activityLevel),
            ResultRowWidget(label: 'Objetivo:', value: goal),
          ],
        ),
      ),
    );
  }
}
