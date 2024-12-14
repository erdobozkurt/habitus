import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/ui/core/ui/inputs/input.dart';
import 'package:habitus/ui/core/ui/modals/modal_layout.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';
import 'package:habitus/ui/home/cubit/home_cubit.dart';
import 'package:habitus/ui/home/widgets/color_picker.dart';
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
          contentBuilder: (context) => [_HabitBasicInfo(controller)],
          bottomWidget: _NavigationButtons(
            controller: controller,
            isLastPage: false,
            onComplete: () {},
          ),
        ),
        ModalPageData(
          title: 'Set Schedule',
          contentBuilder: (context) => [const _HabitSchedule()],
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => controller.value--,
          ),
          bottomWidget: _NavigationButtons(
            controller: controller,
            isLastPage: true,
            onComplete: () {
              context.read<CreateHabitCubit>().saveHabit();
              context.pop();
              context.read<HomeCubit>().getHabits();
            },
          ),
        ),
        ModalPageData(
          title: 'Select Emoji',
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => controller.value = 0,
          ),
          contentBuilder: (context) => [
            EmojiPickerWidget(
              onEmojiSelected: (emoji) {
                context.read<CreateHabitCubit>().emojiChanged(emoji);
                controller.value = 0;
              },
            ),
          ],
        ),
        ModalPageData(
          title: 'Pick a Color',
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => controller.value = 0,
          ),
          contentBuilder: (context) => [
            ColorPickerWidget(
              pickerColor: Colors.blue,
              onColorChanged: (color) {
                context.read<CreateHabitCubit>().colorChanged(color);
                controller.value = 0;
              },
            ),
          ],
        ),
      ],
    );
  }
}

class _HabitBasicInfo extends StatefulWidget {
  const _HabitBasicInfo(this.controller);
  final ValueNotifier<int> controller;

  @override
  _HabitBasicInfoState createState() => _HabitBasicInfoState();
}

class _HabitBasicInfoState extends State<_HabitBasicInfo> {
  late TextEditingController _nameController;
  late TextEditingController _questionController;
  late TextEditingController _targetController;
  HabitType _habitType = HabitType.boolean;

  @override
  void initState() {
    super.initState();
    final cubit = context.read<CreateHabitCubit>();
    _nameController = TextEditingController(text: cubit.state.name)
      ..addListener(() {
        cubit.nameChanged(_nameController.text);
      });
    _questionController = TextEditingController(text: cubit.state.question)
      ..addListener(() {
        cubit.questionChanged(_questionController.text);
      });
    _targetController =
        TextEditingController(text: cubit.state.target?.toString() ?? '')
          ..addListener(() {
            final text = _targetController.text;
            if (text.isEmpty) {
              cubit.targetChanged(0);
            } else {
              cubit.targetChanged(double.tryParse(text) ?? 0);
            }
          });
    _habitType = cubit.state.habitType;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _questionController.dispose();
    _targetController.dispose();
    super.dispose();
  }

  Future<void> _pickColor() async {
    widget.controller.value = 3;
  }

  Future<void> _pickEmoji() async {
    widget.controller.value = 2;
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateHabitCubit>();
    return Column(
      spacing: 16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          controller: _nameController,
          label: 'Habit Name',
          hint: 'Morning Meditation',
        ),
        CustomTextField(
          controller: _questionController,
          label: 'Question',
          hint: 'Did you meditate today?',
        ),
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
          CustomTextField(
            controller: _targetController,
            label: 'Target',
            hint: 'Enter target value',
            keyboardType: TextInputType.number,
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                TextButton(
                  onPressed: _pickColor,
                  child: const Text('Select Color'),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: cubit.state.color,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                TextButton(
                  onPressed: _pickEmoji,
                  child: const Text('Select Emoji'),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).colorScheme.surface,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    cubit.state.emoji,
                    style: const TextStyle(
                      fontSize: 24,
                      shadows: [
                        Shadow(
                          offset: Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
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
      spacing: 16,
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
    required this.onComplete,
  });

  final ValueNotifier<int> controller;
  final bool isLastPage;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateHabitCubit>();

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
              onPressed: () {
                if (isLastPage) {
                  onComplete();
                } else {
                  if (_validateFields(cubit)) {
                    controller.value++;
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all required fields.'),
                      ),
                    );
                  }
                }
              },
              child: Text(isLastPage ? 'Create Habit' : 'Next'),
            ),
          ),
        ],
      ),
    );
  }

  bool _validateFields(CreateHabitCubit cubit) {
    final state = cubit.state;
    // Check required fields excluding color and emoji
    if (state.name.isEmpty || state.question.isEmpty) {
      return false;
    }
    // If habit type is measurable, ensure target is set
    if (state.habitType == HabitType.measurable &&
        (state.target == null || state.target! <= 0)) {
      return false;
    }
    return true;
  }
}
