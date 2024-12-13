import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class EmojiPickerDialog extends StatelessWidget {
  const EmojiPickerDialog({required this.onEmojiSelected, super.key});

  final void Function(String emoji) onEmojiSelected;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 300,
        child: EmojiPicker(
          config: const Config(
            categoryViewConfig: CategoryViewConfig(
              initCategory: Category.SYMBOLS,
            ),
          ),
          onEmojiSelected: (category, emoji) {
            onEmojiSelected(emoji.emoji);
          },
          onBackspacePressed: () {
            onEmojiSelected('');
          },
        ),
      ),
    );
  }
}
