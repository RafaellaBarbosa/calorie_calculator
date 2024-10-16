abstract class Validation {
  static String? validateNotEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Esse campo não pode ser vazio';
    }
    return null;
  }
}
