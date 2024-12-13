import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/ui/core/ui/inputs/input.dart';
import 'package:habitus/ui/core/ui/modals/modal_layout.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';
import 'package:habitus/ui/home/widgets/emoji_picker.dart';

class CreateHabitModal {
  static void show(BuildContext context) {
    final controller = ValueNotifier(0);

    ModalLayout.showMultiPage<void>(
      context: context,
      pageIndexNotifier: controller,
      pages: [
        ModalPageData(
          title: 'Create Habit',
          contentBuilder: (context) => [const _HabitBasicInfo()],
          bottomWidget: _NavigationButtons(
            controller: controller,
            isLastPage: false,
          ),
        ),
        ModalPageData(
          title: 'Set Schedule',
          contentBuilder: (context) => [const _HabitSchedule()],
          bottomWidget: _NavigationButtons(
            controller: controller,
            isLastPage: true,
            onComplete: () {
              context.pop();
            },
          ),
        ),
      ],
    );
  }
}

class _HabitBasicInfo extends StatefulWidget {
  const _HabitBasicInfo();

  @override
  _HabitBasicInfoState createState() => _HabitBasicInfoState();
}

class _HabitBasicInfoState extends State<_HabitBasicInfo> {
  late TextEditingController _nameController;
  late TextEditingController _questionController;
  late TextEditingController _targetController;
  HabitType _habitType = HabitType.boolean;
  Color _selectedColor = Colors.blue;
  String _selectedEmoji = '✨';

  @override
  void initState() {
    super.initState();
    final cubit = context.read<CreateHabitCubit>();
    _nameController = TextEditingController(text: cubit.state.name);
    _questionController = TextEditingController(text: cubit.state.question);
    _targetController =
        TextEditingController(text: cubit.state.target.toString());
    _habitType = cubit.state.habitType;
    _selectedColor = cubit.state.color;
    _selectedEmoji = cubit.state.emoji;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _questionController.dispose();
    _targetController.dispose();
    super.dispose();
  }

  Future<void> _pickColor() async {
    // Implement color picker dialog
    // final color = await showDialog<Color>(
    //   context: context,
    //   builder: (context) => ColorPickerDialog(initialColor: _selectedColor),
    // );
    // if (color != null) {
    //   setState(() {
    //     _selectedColor = color;
    //     context.read<CreateHabitCubit>().colorChanged(color);
    //   });
    // }
  }

  Future<void> _pickEmoji() async {
    // Implement emoji picker dialog
    final emoji = await showDialog<String>(
      context: context,
      builder: (context) => EmojiPickerDialog(
        onEmojiSelected: (emoji) {
          Navigator.of(context).pop(emoji);
        },
      ),
    );
    if (emoji != null) {
      setState(() {
        _selectedEmoji = emoji;
        context.read<CreateHabitCubit>().emojiChanged(emoji);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateHabitCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: _nameController,
          label: 'Habit Name',
          hint: 'Morning Meditation',
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: _questionController,
          label: 'Question',
          hint: 'Did you meditate today?',
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<HabitType>(
          decoration: const InputDecoration(
            labelText: 'Habit Type',
            border: OutlineInputBorder(),
          ),
          value: _habitType,
          items: HabitType.values.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(type == HabitType.boolean ? 'Yes/No' : 'Measurable'),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() {
                _habitType = value;
                cubit.habitTypeChanged(value);
              });
            }
          },
        ),
        if (_habitType == HabitType.measurable)
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: CustomTextField(
              controller: _targetController,
              label: 'Target',
              hint: 'Enter target value',
            ),
          ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: _pickColor,
          child: const Text('Select Color'),
        ),
        Container(
          width: 50,
          height: 50,
          color: _selectedColor,
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: _pickEmoji,
          child: const Text('Select Emoji'),
        ),
        Text(
          'Selected Emoji: $_selectedEmoji',
          style: const TextStyle(fontSize: 24),
        ),
      ],
    );
  }
}

class _HabitSchedule extends StatefulWidget {
  const _HabitSchedule();

  @override
  _HabitScheduleState createState() => _HabitScheduleState();
}

class _HabitScheduleState extends State<_HabitSchedule> {
  final List<String> _daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];
  late List<String> _selectedDays;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<CreateHabitCubit>();
    _selectedDays = List<String>.from(cubit.state.repeatDays);
    _selectedTime = cubit.state.reminderTime;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateHabitCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Repeat Days'),
        Wrap(
          spacing: 8,
          children: _daysOfWeek.map((day) {
            final isSelected = _selectedDays.contains(day);
            return FilterChip(
              label: Text(day),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    _selectedDays.add(day);
                  } else {
                    _selectedDays.remove(day);
                  }
                  cubit.repeatDaysChanged(_selectedDays);
                });
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 16),
        ListTile(
          title: const Text('Reminder Time'),
          trailing: Text(
            _selectedTime != null ? _selectedTime!.format(context) : 'Not set',
          ),
          onTap: () async {
            final time = await showTimePicker(
              context: context,
              initialTime: _selectedTime ?? TimeOfDay.now(),
            );
            if (time != null) {
              setState(() {
                _selectedTime = time;
                cubit.reminderTimeChanged(time);
              });
            }
          },
        ),
      ],
    );
  }
}

class _NavigationButtons extends StatelessWidget {
  const _NavigationButtons({
    required this.controller,
    required this.isLastPage,
    this.onComplete,
  });

  final ValueNotifier<int> controller;
  final bool isLastPage;
  final VoidCallback? onComplete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          if (controller.value > 0)
            Expanded(
              child: OutlinedButton(
                onPressed: () => controller.value--,
                child: const Text('Back'),
              ),
            ),
          if (controller.value > 0) const SizedBox(width: 16),
          Expanded(
            child: FilledButton(
              onPressed: isLastPage ? onComplete : () => controller.value++,
              child: Text(isLastPage ? 'Create Habit' : 'Next'),
            ),
          ),
        ],
      ),
    );
  }
}
