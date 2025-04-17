import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,128}$');
  bool _obscurePassword = true;

  bool get obscurePassword => _obscurePassword;

  void hidePassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email address";
    }
    if (!value.contains("@")) {
      return "Please enter a valid email address";
    }
    return null;
  }

  bool isPasswordValid(String password) {
    final regex = passwordRegex;
    return regex.hasMatch(password);
  }

  String ? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your password";
    }
    else if (!isPasswordValid(value)) {
      return 'Password must be at least 8 characters,\ninclude uppercase, lowercase, number, and symbol';
    }
    return null;
  }

  void clearFields() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}