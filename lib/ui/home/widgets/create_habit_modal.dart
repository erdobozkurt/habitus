import 'package:flutter/material.dart';
import 'package:habitus/ui/core/ui/modals/modal_layout.dart';

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
            onComplete: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}

class _HabitBasicInfo extends StatelessWidget {
  const _HabitBasicInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TextField(
          decoration: InputDecoration(
            labelText: 'Habit Name',
            hintText: 'e.g. Morning Meditation',
          ),
        ),
        const SizedBox(height: 16),
        const TextField(
          maxLines: 3,
          decoration: InputDecoration(
            labelText: 'Description',
            hintText: 'What do you want to achieve?',
          ),
        ),
        const SizedBox(height: 16),
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Habit Type',
          ),
          items: const [
            DropdownMenuItem(
              value: 'boolean',
              child: Text('Yes/No'),
            ),
            DropdownMenuItem(
              value: 'measurable',
              child: Text('Measurable'),
            ),
          ],
          onChanged: (value) {},
        ),
      ],
    );
  }
}

class _HabitSchedule extends StatelessWidget {
  const _HabitSchedule();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Repeat'),
        Wrap(
          spacing: 8,
          children: [
            'Mon',
            'Tue',
            'Wed',
            'Thu',
            'Fri',
            'Sat',
            'Sun',
          ]
              .map(
                (day) => FilterChip(
                  label: Text(day),
                  onSelected: (selected) {},
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 16),
        ListTile(
          title: const Text('Reminder Time'),
          trailing: const Text('09:00 AM'),
          onTap: () async {
            await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );
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
            child: ElevatedButton(
              onPressed: isLastPage ? onComplete : () => controller.value++,
              child: Text(isLastPage ? 'Create Habit' : 'Next'),
            ),
          ),
        ],
      ),
    );
  }
}
