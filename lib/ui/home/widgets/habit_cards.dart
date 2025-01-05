// lib/ui/core/ui/cards/habit_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/domain/enums/status.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';
import 'package:habitus/ui/core/themes/constants/gap_constants.dart';
import 'package:habitus/ui/core/themes/constants/padding_constants.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';
import 'package:habitus/ui/habit_progress/habit_progress_modal.dart';
import 'package:habitus/ui/home/cubit/home_cubit.dart';
import 'package:habitus/utils/extensions/context_extension.dart';

class HabitCard extends StatefulWidget {
  const HabitCard({
    required this.habit,
    required this.onToggleComplete,
    super.key,
  });

  final Habit habit;
  final ValueChanged<bool> onToggleComplete;

  @override
  State<HabitCard> createState() => _HabitCardState();
}

class _HabitCardState extends State<HabitCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) => Transform.scale(
        scale: _scaleAnimation.value,
        child: child,
      ),
      child: GestureDetector(
        onTapDown: (_) => _controller.forward(),
        onTapUp: (_) => _controller.reverse(),
        onTapCancel: () => _controller.reverse(),
        onTap: () {
          if (widget.habit.type == HabitType.measurable) {
            HabitProgressModal.show(context, widget.habit);
          }
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: PaddingConstants.cardPadding,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: widget.habit.color,
            ),
            child: widget.habit.type == HabitType.boolean
                ? _BooleanHabitContent(
                    habit: widget.habit,
                    onToggle: widget.onToggleComplete,
                  )
                : _MeasurableHabitContent(
                    habit: widget.habit,
                    onProgress: (value) {
                      HabitProgressModal.show(context, widget.habit);
                    },
                  ),
          ),
        ),
      ),
    );
  }
}

class _BooleanHabitContent extends StatelessWidget {
  const _BooleanHabitContent({
    required this.habit,
    required this.onToggle,
  });

  final Habit habit;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;
    return Row(
      children: [
        Text(
          habit.emoji,
          style: textTheme.headlineLarge,
        ),
        GapConstants.gapMedium,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                habit.title,
                style: textTheme.titleMedium?.apply(
                  color: colorScheme.onPrimary,
                  fontWeightDelta: 2,
                ),
              ),
              Text(
                habit.question,
                style: textTheme.bodySmall?.apply(
                  color: colorScheme.onPrimary,
                  fontWeightDelta: 2,
                ),
              ),
            ],
          ),
        ),
        if (context.read<HomeCubit>().state.toggleStatus == Status.loading)
          const CircularProgressIndicator.adaptive()
        else
          _AnimatedCheckbox(
            value: habit.isCompleted,
            onChanged: onToggle,
          ),
      ],
    );
  }
}

class _MeasurableHabitContent extends StatelessWidget {
  const _MeasurableHabitContent({
    required this.habit,
    required this.onProgress,
  });

  final Habit habit;
  final ValueChanged<double> onProgress;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              habit.emoji,
              style: textTheme.headlineLarge,
            ),
            GapConstants.gapMedium,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    habit.title,
                    style: context.textTheme.titleMedium?.apply(
                      color: colorScheme.onPrimary,
                      fontWeightDelta: 2,
                    ),
                  ),
                  Text(
                    habit.question,
                    style: context.textTheme.bodySmall?.apply(
                      color: colorScheme.onPrimary,
                      fontWeightDelta: 2,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${habit.current.toInt()}/${habit.target.toInt()}',
              style: textTheme.titleMedium?.apply(
                color: colorScheme.onPrimary,
                fontWeightDelta: 2,
              ),
            ),
          ],
        ),
        GapConstants.gapSmall,
        LinearProgressIndicator(
          value: habit.current / habit.target,
          valueColor: AlwaysStoppedAnimation<Color>(colorScheme.onPrimary),
          backgroundColor: colorScheme.onPrimary.withAlpha(100),
        ),
      ],
    );
  }
}

class _AnimatedCheckbox extends StatelessWidget {
  const _AnimatedCheckbox({
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: value
              ? colorScheme.onPrimary
              : colorScheme.onPrimary.withAlpha(100),
          borderRadius: BorderRadius.circular(6),
        ),
        child: value
            ? Icon(
                Icons.check,
                size: 18,
                color: colorScheme.primary,
              )
            : null,
      ),
    );
  }
}
