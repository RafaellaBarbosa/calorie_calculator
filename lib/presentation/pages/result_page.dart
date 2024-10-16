import 'package:flutter/material.dart';

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
            const Text(
              'Calorias Diárias Recomendadas',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '${calories.toStringAsFixed(2)} kcal',
              style: const TextStyle(fontSize: 22, color: Colors.blue),
            ),
            const SizedBox(height: 20),
            _buildResultRow('Peso:', '${weight.toStringAsFixed(1)} kg'),
            const Divider(),
            _buildResultRow('Altura:', '${height.toStringAsFixed(1)} cm'),
            const Divider(),
            _buildResultRow('Idade:', '$age anos'),
            const Divider(),
            _buildResultRow('Gênero:', gender),
            const Divider(),
            _buildResultRow('Nível de Atividade:', activityLevel),
            const Divider(),
            _buildResultRow('Objetivo:', goal),
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
