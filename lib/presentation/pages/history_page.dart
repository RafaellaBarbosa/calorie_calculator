import 'package:flutter/material.dart';

import '../../controller/calorie_controller.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final _controller = CalorieController();
  Map<String, dynamic>? _lastCalculation;

  @override
  void initState() {
    super.initState();
    _loadLastCalculation();
  }

  Future<void> _loadLastCalculation() async {
    final lastCalculation = await _controller.getLastCalculation();
    setState(() {
      _lastCalculation = lastCalculation;
    });
  }

  Future<void> _clearHistory() async {
    await _controller.clearLastCalculation();
    setState(() {
      _lastCalculation = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Último Cálculo',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _lastCalculation == null
            ? const Center(child: Text('Nenhum resultado salvo'))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    'Calorias Diárias Recomendadas',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${_lastCalculation!['calories'].toStringAsFixed(2) ?? 'N/A'} kcal',
                    style: const TextStyle(fontSize: 22, color: Colors.blue),
                  ),
                  const SizedBox(height: 20),
                  _buildResultRow('Peso:', '${_lastCalculation!['weight']} kg'),
                  _buildResultRow(
                      'Altura:', '${_lastCalculation!['height']} cm'),
                  _buildResultRow('Idade:', '${_lastCalculation!['age']} anos'),
                  _buildResultRow(
                      'Gênero:', _lastCalculation!['gender'] ?? 'Desconhecido'),
                  _buildResultRow('Nível de Atividade:',
                      _lastCalculation!['activityLevel'] ?? 'Desconhecido'),
                  _buildResultRow(
                      'Objetivo:', _lastCalculation!['goal'] ?? 'Desconhecido'),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _clearHistory,
                    child: const Text('Limpar Histórico'),
                  ),
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
