import 'package:shared_preferences/shared_preferences.dart';

class CalorieController {
  double calculateCalories({
    required double weight,
    required double height,
    required int age,
    required String gender,
    required String activityLevel,
    required String goal,
  }) {
    double tmb;

    if (gender == 'Masculino') {
      tmb = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      tmb = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }

    double activityMultiplier;

    switch (activityLevel) {
      case 'Levemente Ativo':
        activityMultiplier = 1.375;
        break;
      case 'Moderadamente Ativo':
        activityMultiplier = 1.55;
        break;
      case 'Muito Ativo':
        activityMultiplier = 1.725;
        break;
      default:
        activityMultiplier = 1.2;
    }

    double dailyCalories = tmb * activityMultiplier;

    if (goal == 'Perda de Peso') {
      dailyCalories *= 0.8;
    } else {
      dailyCalories *= 1.15;
    }

    return dailyCalories;
  }

  Future<void> saveLastCalculation({
    required double weight,
    required double height,
    required int age,
    required String gender,
    required String activityLevel,
    required String goal,
    required double calories,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('weight', weight);
    prefs.setDouble('height', height);
    prefs.setInt('age', age);
    prefs.setString('gender', gender);
    prefs.setString('activityLevel', activityLevel);
    prefs.setString('goal', goal);
    prefs.setDouble('calories', calories);
  }

  Future<Map<String, dynamic>?> getLastCalculation() async {
    final prefs = await SharedPreferences.getInstance();
    final weight = prefs.getDouble('weight');
    final height = prefs.getDouble('height');
    final age = prefs.getInt('age');
    final gender = prefs.getString('gender');
    final activityLevel = prefs.getString('activityLevel');
    final goal = prefs.getString('goal');
    final calories = prefs.getDouble('calories');

    if (weight != null &&
        height != null &&
        age != null &&
        gender != null &&
        activityLevel != null &&
        goal != null &&
        calories != null) {
      return {
        'weight': weight,
        'height': height,
        'age': age,
        'gender': gender,
        'activityLevel': activityLevel,
        'goal': goal,
        'calories': calories,
      };
    }

    return null;
  }

  Future<void> clearLastCalculation() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
