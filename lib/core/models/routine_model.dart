import 'dart:ui';

class Routine {
  const Routine({
    required this.id,
    required this.title,
    required this.description,
    required this.time,
    this.emoji = '✨',
    this.color,
    this.isCompleted = false,
  });
  final String id;
  final String title;
  final String description;
  final DateTime time;
  final String? emoji;
  final Color? color;
  final bool isCompleted;
}
