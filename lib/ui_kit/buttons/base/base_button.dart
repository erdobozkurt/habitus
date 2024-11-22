// lib/ui_kit/buttons/base/base_button.dart
import 'package:flutter/material.dart';

enum ButtonSize { small, medium, large }

class BaseButton extends StatelessWidget {
  const BaseButton({
    required this.onPressed,
    required this.child,
    this.size = ButtonSize.medium,
    this.isLoading = false,
    this.width,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final ButtonSize size;
  final bool isLoading;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: child,
    );
  }
}
