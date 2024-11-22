import 'package:flutter/material.dart';

class OnboardingPageModel {
  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.imageAsset,
    this.bgColor = Colors.blue,
    this.textColor = Colors.white,
  });
  final String title;
  final String description;
  final String imageAsset;
  final Color bgColor;
  final Color textColor;
}
