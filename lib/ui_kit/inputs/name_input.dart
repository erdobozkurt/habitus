import 'package:flutter/material.dart';
import 'package:habitus/ui_kit/inputs/input.dart';

class NameInput extends StatelessWidget {
  const NameInput({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return const CustomTextField(
      label: 'Name',
      hint: 'Enter your name',
      prefixIcon: Icon(Icons.person),
    );
  }
}
