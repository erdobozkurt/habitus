import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({
    required this.pickerColor,
    required this.onColorChanged,
    super.key,
  });

  final Color pickerColor;
  final void Function(Color color) onColorChanged;

  @override
  Widget build(BuildContext context) {
    return BlockPicker(
      pickerColor: pickerColor,
      onColorChanged: onColorChanged,
    );
  }
}
