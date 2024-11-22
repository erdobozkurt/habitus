// lib/ui_kit/widgets/password_field.dart
import 'package:flutter/material.dart';
import 'package:habitus/core/utils/validators.dart';
import 'package:habitus/ui_kit/inputs/input.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({
    super.key,
    this.label = 'Password',
    this.hint = 'Enter your password',
    this.controller,
  });
  final String label;
  final String hint;

  final TextEditingController? controller;

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: widget.label,
      hint: widget.hint,
      prefixIcon: const Icon(Icons.lock_outline_rounded),
      validator: Validators.password,
      controller: widget.controller,
      obscureText: !_isPasswordVisible,
      suffixIcon: IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      ),
    );
  }

  //Usage
  // PasswordInput(controller: _passwordController),
}
