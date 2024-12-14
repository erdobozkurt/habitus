// lib/feature/auth/widgets/form_content.dart
import 'package:flutter/material.dart';
import 'package:habitus/ui/core/themes/constants/gap_constants.dart';
import 'package:habitus/ui/core/themes/constants/padding_constants.dart';

class FormContent extends StatefulWidget {
  const FormContent({
    required this.children,
    required this.title,
    super.key,
    this.formKey,
    this.maxWidth = 400,
    this.padding = PaddingConstants.inputFieldPadding,
  });

  final List<Widget> children;
  final String title;

  final double maxWidth;
  final EdgeInsetsGeometry padding;
  final GlobalKey<FormState>? formKey;
  @override
  State<FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
      padding: widget.padding,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: widget.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            GapConstants.h32,
            ...widget.children,
          ],
        ),
      ),
    );
  }
}
