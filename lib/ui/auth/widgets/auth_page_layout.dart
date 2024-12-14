// lib/feature/auth/widgets/auth_page_layout.dart

import 'package:flutter/material.dart';
import 'package:habitus/ui/auth/widgets/auth_logo.dart';
import 'package:habitus/ui/core/themes/constants/padding_constants.dart';
import 'package:habitus/utils/extensions/context_extension.dart';

class AuthPageLayout extends StatelessWidget {
  const AuthPageLayout({
    required this.form,
    super.key,
  });

  final Widget form;

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = context.width < 600;

    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: Center(
        child: isSmallScreen
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AuthLogo(),
                  form,
                ],
              )
            : Container(
                padding: PaddingConstants.screenEdge,
                constraints: const BoxConstraints(maxWidth: 800),
                child: Row(
                  children: [
                    const Expanded(child: AuthLogo()),
                    Expanded(child: Center(child: form)),
                  ],
                ),
              ),
      ),
    );
  }
}
