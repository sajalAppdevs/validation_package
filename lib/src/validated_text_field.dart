import 'package:flutter/material.dart';

typedef Validator = String? Function(String? value);

class ValidatedTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Validator? validator;
  final bool obscureText;

  const ValidatedTextField({
    super.key,
    required this.label,
    required this.controller,
    this.validator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.grey.shade100,
        errorStyle: const TextStyle(color: Colors.redAccent),
      ),
    );
  }
}
