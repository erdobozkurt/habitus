// lib/ui/core/ui/cards/habit_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/domain/enums/status.dart';
import 'package:habitus/domain/models/habit_record/habit_record_model.dart';
import 'package:habitus/ui/core/themes/constants/gap_constants.dart';
import 'package:habitus/ui/core/themes/constants/padding_constants.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';
import 'package:habitus/ui/habit_progress/habit_progress_modal.dart';
import 'package:habitus/ui/home/cubit/home_cubit.dart';
import 'package:habitus/utils/extensions/context_extension.dart';

class HabitCard extends StatefulWidget {
  const HabitCard({
    required this.record,
    required this.onToggleComplete,
    super.key,
  });

  final HabitRecord record;
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
          if (widget.record.habit.type == HabitType.measurable) {
            HabitProgressModal.show(context, widget.record);
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
              color: widget.record.habit.color,
            ),
            child: widget.record.habit.type == HabitType.boolean
                ? _BooleanHabitContent(
                    record: widget.record,
                    onToggle: widget.onToggleComplete,
                  )
                : _MeasurableHabitContent(
                    record: widget.record,
                    onProgress: (value) {
                      HabitProgressModal.show(context, widget.record);
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
    required this.record,
    required this.onToggle,
  });

  final HabitRecord record;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.theme.colorScheme;
    final textTheme = context.textTheme;
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.toggleStatus != current.toggleStatus,
      builder: (context, state) {
        return Row(
          children: [
            Text(
              record.habit.emoji,
              style: textTheme.headlineLarge,
            ),
            GapConstants.gapMedium,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.habit.title,
                    style: textTheme.titleMedium?.apply(
                      color: colorScheme.onPrimary,
                      fontWeightDelta: 2,
                    ),
                  ),
                  Text(
                    record.habit.question,
                    style: textTheme.bodySmall?.apply(
                      color: colorScheme.onPrimary,
                      fontWeightDelta: 2,
                    ),
                  ),
                ],
              ),
            ),
            if (state.toggleStatus == Status.loading)
              const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(),
              )
            else
              _AnimatedCheckbox(
                value: record.isCompleted,
                onChanged: onToggle,
              ),
          ],
        );
      },
    );
  }
}

class _MeasurableHabitContent extends StatelessWidget {
  const _MeasurableHabitContent({
    required this.record,
    required this.onProgress,
  });

  final HabitRecord record;
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
              record.habit.emoji,
              style: textTheme.headlineLarge,
            ),
            GapConstants.gapMedium,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    record.habit.title,
                    style: context.textTheme.titleMedium?.apply(
                      color: colorScheme.onPrimary,
                      fontWeightDelta: 2,
                    ),
                  ),
                  Text(
                    record.habit.question,
                    style: context.textTheme.bodySmall?.apply(
                      color: colorScheme.onPrimary,
                      fontWeightDelta: 2,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${record.value.toInt()}/${record.habit.target.toInt()}',
              style: textTheme.titleMedium?.apply(
                color: colorScheme.onPrimary,
                fontWeightDelta: 2,
              ),
            ),
          ],
        ),
        GapConstants.gapSmall,
        LinearProgressIndicator(
          value: record.value / record.habit.target,
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
