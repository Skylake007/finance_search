// ignore: file_names
class PasswordValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < 6 ||
        !RegExp(r'(?=.*[a-zA-Z])(?=.*\d)').hasMatch(value)) {
      return 'Password must contain at least 6, 1 letter and number ';
    }
    return null;
  }
}
