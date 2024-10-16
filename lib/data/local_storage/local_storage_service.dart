import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  Future<void> saveLastCalculation(double weight, double height, int age, double calories) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('weight', weight);
    prefs.setDouble('height', height);
    prefs.setInt('age', age);
    prefs.setDouble('calories', calories);
  }

  Future<Map<String, dynamic>?> getLastCalculation() async {
    final prefs = await SharedPreferences.getInstance();
    final weight = prefs.getDouble('weight');
    final height = prefs.getDouble('height');
    final age = prefs.getInt('age');
    final calories = prefs.getDouble('calories');

    if (weight != null && height != null && age != null && calories != null) {
      return {
        'weight': weight,
        'height': height,
        'age': age,
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
