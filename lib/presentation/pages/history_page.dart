import 'package:flutter/material.dart';

import '../../controller/calorie_controller.dart';
import '../widgets/card_calories_widget.dart';
import '../widgets/result_row_widget.dart';

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
                  CardCalorieWidget(
                    title: 'Calorias Diárias Recomendadas',
                    calories:
                        '${_lastCalculation!['calories'].toStringAsFixed(2)} kcal',
                  ),
                  const SizedBox(height: 20),
                  ResultRowWidget(
                    label: 'Peso:',
                    value: '${_lastCalculation!['weight']} kg',
                  ),
                  ResultRowWidget(
                      label: 'Altura:',
                      value: '${_lastCalculation!['height']} cm'),
                  ResultRowWidget(
                      label: 'Idade:',
                      value: '${_lastCalculation!['age']} anos'),
                  ResultRowWidget(
                      label: 'Gênero:',
                      value: _lastCalculation!['gender'] ?? 'Desconhecido'),
                  ResultRowWidget(
                      label: 'Nível de Atividade:',
                      value:
                          _lastCalculation!['activityLevel'] ?? 'Desconhecido'),
                  ResultRowWidget(
                      label: 'Objetivo:',
                      value: _lastCalculation!['goal'] ?? 'Desconhecido'),
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
}
