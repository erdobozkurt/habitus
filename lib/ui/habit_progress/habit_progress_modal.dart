import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';
import 'package:habitus/ui/core/ui/buttons/variants/primary_button.dart';
import 'package:habitus/ui/core/ui/modals/modal_layout.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';
import 'package:habitus/ui/habit_progress/cubit/habit_progress_cubit.dart';
import 'package:habitus/ui/habit_progress/cubit/habit_progress_state.dart';
import 'package:habitus/ui/home/cubit/home_cubit.dart';

class HabitProgressModal extends StatefulWidget {
  const HabitProgressModal({
    required this.habit,
    super.key,
  });

  final Habit habit;

  static void show(BuildContext context, Habit habit) {
    ModalLayout.show<void>(
      context: context,
      pageData: ModalPageData(
        title: 'Track Progress',
        contentBuilder: (modalContext) => [
          BlocProvider(
            create: (context) => HabitProgressCubit(
              habitRepository: context.read(),
              habit: habit,
            ),
            child: HabitProgressModal(habit: habit),
          ),
        ],
      ),
    );
  }

  @override
  State<HabitProgressModal> createState() => _HabitProgressModalState();
}

class _HabitProgressModalState extends State<HabitProgressModal> {
  late final TextEditingController _progressController;

  @override
  void initState() {
    super.initState();
    _progressController = TextEditingController();
  }

  @override
  void dispose() {
    _progressController.dispose();
    super.dispose();
  }

  Future<void> _handleSave() async {
    final progress = double.tryParse(_progressController.text);
    if (progress == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid number')),
      );
      return;
    }

    try {
      final cubit = context.read<HabitProgressCubit>()
        ..updateProgress(progress);
      await cubit.saveProgress();
      if (!mounted) return;
      await context.read<HomeCubit>().getHabits();
      if (!mounted) return;
      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save progress')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitProgressCubit, HabitProgressState>(
      builder: (context, state) {
        return Column(
          spacing: 24,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.habit.question,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            // Number picker
            SizedBox(
              height: 200,
              child: CupertinoPicker(
                itemExtent: 32,
                scrollController: FixedExtentScrollController(
                  initialItem: state.currentValue.toInt(),
                ),
                onSelectedItemChanged: (index) {
                  _progressController.text = index.toString();
                },
                children: List.generate(
                  widget.habit.target.toInt() + 1,
                  (index) => Text(index.toString()),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                onPressed: state.status == FormStatus.submissionInProgress
                    ? null
                    : _handleSave,
                child: state.status == FormStatus.submissionInProgress
                    ? const CircularProgressIndicator()
                    : const Text('Save Progress'),
              ),
            ),
          ],
        );
      },
    );
  }
}
