// lib/core/modals/wolt_navigation_controller.dart
import 'package:flutter/material.dart';

/// A controller to manage the navigation of a Wolt navigation bar.
/// Example:
/// ```dart
/// final controller = WoltNavigationController();
/// controller.next(); // Move to the next page
/// controller.previous(); // Move to the previous page
/// print(controller.currentIndex); // Get the current index
/// controller.currentIndex = 2; // Set the current index

class WoltNavigationController extends ValueNotifier<int> {
  WoltNavigationController() : super(0);

  void next() => value++;
  void previous() => value--;

  // Getter and setter pair
  int get currentIndex => value;
  set currentIndex(int index) => value = index;

  bool get canGoNext => true; // Implement your logic
  bool get canGoPrevious => value > 0;
}
