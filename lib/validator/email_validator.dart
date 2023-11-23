import 'package:flutter/material.dart';

class EmailValidator {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email.';
    }

    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value)) {
      return 'Email not define';
    }
    return null;
  }
}

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  const EmailTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
          labelText: 'Email', hintText: 'Nhập địa chỉ email của bạn'),
      validator: EmailValidator.validate,
    );
  }
}
