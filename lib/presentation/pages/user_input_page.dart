import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../controller/calorie_controller.dart';
import '../widgets/dropdown_widget.dart';
import '../widgets/text_form_field_widget.dart';
import 'history_page.dart';
import 'result_page.dart';

class UserInputScreen extends StatefulWidget {
  const UserInputScreen({super.key});

  @override
  State<UserInputScreen> createState() => _UserInputScreenState();
}

class _UserInputScreenState extends State<UserInputScreen> {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _ageController = TextEditingController();
  String _gender = 'Masculino';
  String _activityLevel = 'Sedentário';
  String _goal = 'Perda de Peso';

  final _controller = CalorieController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora de Calorias',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormFildWidget(
                  label: 'Qual é o seu Peso (kg)',
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  hintText: 'Digite seu Peso (em kg)',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'esse campo não pode ser vazio';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                TextFormFildWidget(
                  label: 'Qual é a sua altura?(cm)',
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'esse campo não pode ser vazio';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                TextFormFildWidget(
                  label: 'Qual é a sua idade?',
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'esse campo não pode ser vazio';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                DropdownWidget(
                    label: 'Qual é o seu Gênero?',
                    options: const ['Masculino', 'Feminino'],
                    currentValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value;
                      });
                    }),
                DropdownWidget(
                    label: 'Qual é o seu nível de atividade diária?',
                    options: const [
                      'Sedentário',
                      'Levemente Ativo',
                      'Moderadamente Ativo',
                      'Muito Ativo'
                    ],
                    currentValue: _activityLevel,
                    onChanged: (value) {
                      setState(() {
                        _activityLevel = value;
                      });
                    }),
                DropdownWidget(
                    label: 'Qual é o seu objetivo?',
                    options: const ['Perda de Peso', 'Ganho de Peso'],
                    currentValue: _goal,
                    onChanged: (value) {
                      setState(() {
                        _goal = value;
                      });
                    }),
                ElevatedButton(
                  onPressed: () {
                    _calculateCalories();
                    formKey.currentState?.validate();
                  },
                  child: const Text('Calcular Calorias'),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HistoryScreen(),
                      ),
                    );
                  },
                  child: const Text('Ver Histórico'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _calculateCalories() {
    final weight = double.tryParse(_weightController.text);
    final height = double.tryParse(_heightController.text);
    final age = int.tryParse(_ageController.text);

    if (weight == null ||
        height == null ||
        age == null ||
        weight <= 0 ||
        height <= 0 ||
        age <= 0) {
      return;
    }

    final calories = _controller.calculateCalories(
      weight: weight,
      height: height,
      age: age,
      gender: _gender,
      activityLevel: _activityLevel,
      goal: _goal,
    );

    _controller.saveLastCalculation(
        weight: weight,
        height: height,
        age: age,
        calories: calories,
        gender: _gender,
        activityLevel: _activityLevel,
        goal: _goal);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          weight: weight,
          height: height,
          age: age,
          gender: _gender,
          activityLevel: _activityLevel,
          goal: _goal,
          calories: calories,
        ),
      ),
    );
  }
}
