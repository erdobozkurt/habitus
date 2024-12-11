import 'package:flutter/material.dart';
import 'package:habitus/ui/core/ui/inputs/input.dart';
import 'package:habitus/utils/validators.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(
      label: 'Email',
      hint: 'Enter your email',
      prefixIcon: Icon(Icons.email),
      validator: Validators.email,
    );
  }
}
