import 'package:flutter/material.dart';

class MaterialTheme {
  const MaterialTheme(this.textTheme);
  final TextTheme textTheme;

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff69548d),
      surfaceTint: Color(0xff69548d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffecdcff),
      onPrimaryContainer: Color(0xff240e45),
      secondary: Color(0xff635b70),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffeadef7),
      onSecondaryContainer: Color(0xff1f182a),
      tertiary: Color(0xff7f525c),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd9e0),
      onTertiaryContainer: Color(0xff32101a),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff1d1a20),
      onSurfaceVariant: Color(0xff49454e),
      outline: Color(0xff7a757f),
      outlineVariant: Color(0xffcbc4cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffd4bbfc),
      primaryFixed: Color(0xffecdcff),
      onPrimaryFixed: Color(0xff240e45),
      primaryFixedDim: Color(0xffd4bbfc),
      onPrimaryFixedVariant: Color(0xff513c73),
      secondaryFixed: Color(0xffeadef7),
      onSecondaryFixed: Color(0xff1f182a),
      secondaryFixedDim: Color(0xffcec2db),
      onSecondaryFixedVariant: Color(0xff4b4357),
      tertiaryFixed: Color(0xffffd9e0),
      onTertiaryFixed: Color(0xff32101a),
      tertiaryFixedDim: Color(0xfff1b7c3),
      onTertiaryFixedVariant: Color(0xff643b45),
      surfaceDim: Color(0xffded8e0),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f1f9),
      surfaceContainer: Color(0xfff3ecf4),
      surfaceContainerHigh: Color(0xffede6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff4d386f),
      surfaceTint: Color(0xff69548d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff806aa5),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff473f53),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff7a7187),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff603741),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff986772),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff1d1a20),
      onSurfaceVariant: Color(0xff45414a),
      outline: Color(0xff625d67),
      outlineVariant: Color(0xff7e7983),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xffd4bbfc),
      primaryFixed: Color(0xff806aa5),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff67518a),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff7a7187),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff61586d),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff986772),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff7c4f5a),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffded8e0),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f1f9),
      surfaceContainer: Color(0xfff3ecf4),
      surfaceContainerHigh: Color(0xffede6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2b164c),
      surfaceTint: Color(0xff69548d),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff4d386f),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff261f31),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff473f53),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3a1721),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff603741),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffef7ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff26222b),
      outline: Color(0xff45414a),
      outlineVariant: Color(0xff45414a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff322f35),
      inversePrimary: Color(0xfff3e8ff),
      primaryFixed: Color(0xff4d386f),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff362157),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff473f53),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff31293c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff603741),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff46212b),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffded8e0),
      surfaceBright: Color(0xfffef7ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff8f1f9),
      surfaceContainer: Color(0xfff3ecf4),
      surfaceContainerHigh: Color(0xffede6ee),
      surfaceContainerHighest: Color(0xffe7e0e8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd4bbfc),
      surfaceTint: Color(0xffd4bbfc),
      onPrimary: Color(0xff3a255b),
      primaryContainer: Color(0xff513c73),
      onPrimaryContainer: Color(0xffecdcff),
      secondary: Color(0xffcec2db),
      onSecondary: Color(0xff342d40),
      secondaryContainer: Color(0xff4b4357),
      onSecondaryContainer: Color(0xffeadef7),
      tertiary: Color(0xfff1b7c3),
      onTertiary: Color(0xff4a252f),
      tertiaryContainer: Color(0xff643b45),
      onTertiaryContainer: Color(0xffffd9e0),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff151218),
      onSurface: Color(0xffe7e0e8),
      onSurfaceVariant: Color(0xffcbc4cf),
      outline: Color(0xff958e99),
      outlineVariant: Color(0xff49454e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff69548d),
      primaryFixed: Color(0xffecdcff),
      onPrimaryFixed: Color(0xff240e45),
      primaryFixedDim: Color(0xffd4bbfc),
      onPrimaryFixedVariant: Color(0xff513c73),
      secondaryFixed: Color(0xffeadef7),
      onSecondaryFixed: Color(0xff1f182a),
      secondaryFixedDim: Color(0xffcec2db),
      onSecondaryFixedVariant: Color(0xff4b4357),
      tertiaryFixed: Color(0xffffd9e0),
      onTertiaryFixed: Color(0xff32101a),
      tertiaryFixedDim: Color(0xfff1b7c3),
      onTertiaryFixedVariant: Color(0xff643b45),
      surfaceDim: Color(0xff151218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff0f0d12),
      surfaceContainerLow: Color(0xff1d1a20),
      surfaceContainer: Color(0xff211e24),
      surfaceContainerHigh: Color(0xff2c292f),
      surfaceContainerHighest: Color(0xff37343a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffd8c0ff),
      surfaceTint: Color(0xffd4bbfc),
      onPrimary: Color(0xff1f0840),
      primaryContainer: Color(0xff9d86c3),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffd2c6df),
      onSecondary: Color(0xff1a1325),
      secondaryContainer: Color(0xff978ca4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff6bcc8),
      onTertiary: Color(0xff2b0b15),
      tertiaryContainer: Color(0xffb7838e),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff151218),
      onSurface: Color(0xfffff9fe),
      onSurfaceVariant: Color(0xffcfc8d3),
      outline: Color(0xffa7a1ab),
      outlineVariant: Color(0xff87818b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff523d75),
      primaryFixed: Color(0xffecdcff),
      onPrimaryFixed: Color(0xff19023b),
      primaryFixedDim: Color(0xffd4bbfc),
      onPrimaryFixedVariant: Color(0xff402b62),
      secondaryFixed: Color(0xffeadef7),
      onSecondaryFixed: Color(0xff140e1f),
      secondaryFixedDim: Color(0xffcec2db),
      onSecondaryFixedVariant: Color(0xff3a3346),
      tertiaryFixed: Color(0xffffd9e0),
      onTertiaryFixed: Color(0xff250610),
      tertiaryFixedDim: Color(0xfff1b7c3),
      onTertiaryFixedVariant: Color(0xff512a34),
      surfaceDim: Color(0xff151218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff0f0d12),
      surfaceContainerLow: Color(0xff1d1a20),
      surfaceContainer: Color(0xff211e24),
      surfaceContainerHigh: Color(0xff2c292f),
      surfaceContainerHighest: Color(0xff37343a),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffff9fe),
      surfaceTint: Color(0xffd4bbfc),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffd8c0ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffff9fe),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd2c6df),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffff9f9),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xfff6bcc8),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff151218),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffff9fe),
      outline: Color(0xffcfc8d3),
      outlineVariant: Color(0xffcfc8d3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe7e0e8),
      inversePrimary: Color(0xff331f54),
      primaryFixed: Color(0xffefe1ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffd8c0ff),
      onPrimaryFixedVariant: Color(0xff1f0840),
      secondaryFixed: Color(0xffefe2fc),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd2c6df),
      onSecondaryFixedVariant: Color(0xff1a1325),
      tertiaryFixed: Color(0xffffdfe4),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xfff6bcc8),
      onTertiaryFixedVariant: Color(0xff2b0b15),
      surfaceDim: Color(0xff151218),
      surfaceBright: Color(0xff3b383e),
      surfaceContainerLowest: Color(0xff0f0d12),
      surfaceContainerLow: Color(0xff1d1a20),
      surfaceContainer: Color(0xff211e24),
      surfaceContainerHigh: Color(0xff2c292f),
      surfaceContainerHighest: Color(0xff37343a),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                WidgetStateProperty.all<Color>(colorScheme.primary),
            foregroundColor:
                WidgetStateProperty.all<Color>(colorScheme.onPrimary),
            shape: WidgetStateProperty.all<OutlinedBorder>(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          ),
        ),
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
  final Color seed;
  final Color value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
