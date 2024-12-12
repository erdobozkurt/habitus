import 'package:flutter/material.dart';
import 'package:habitus/utils/managers/asset_manager.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    final isSmallScreen = MediaQuery.of(context).size.width < 600;
    final assetManager = AssetsManager.instance;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          assetManager.appLogo,
          width: isSmallScreen ? 120 : 240,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Welcome to Habitus!',
            textAlign: TextAlign.center,
            style: isSmallScreen
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
