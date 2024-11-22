import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    required this.selectedDate,
    required this.onDateSelected,
    this.firstDate,
    this.lastDate,
    super.key,
  });

  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;

  @override
  Widget build(BuildContext context) {
    return EasyDateTimeLinePicker(
      firstDate: firstDate ?? DateTime.now().subtract(const Duration(days: 3)),
      lastDate: lastDate ?? DateTime.now().add(const Duration(days: 3)),
      focusedDate: selectedDate,
      onDateChange: onDateSelected,
    );
  }
}
