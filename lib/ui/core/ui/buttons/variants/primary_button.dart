// lib/ui_kit/buttons/variants/primary_button.dart
import 'package:flutter/material.dart';
import 'package:habitus/ui/core/ui/buttons/base/base_button.dart';
import 'package:habitus/utils/extensions/context_extension.dart';

class PrimaryButton extends BaseButton {
  const PrimaryButton({
    required super.onPressed,
    required super.child,
    super.size,
    super.isLoading,
    super.width,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: FilledButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: context.theme.colorScheme.onPrimary,
                ),
              )
            : child,
      ),
    );
  }
}
