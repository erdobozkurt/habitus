// lib/ui/core/ui/cards/habit_card.dart
import 'package:flutter/material.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';
import 'package:intl/intl.dart';

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
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: widget.habit.color,
            ),
            child: widget.habit.map(
              boolean: (habit) => _BooleanHabitContent(
                habit: habit,
                onToggle: widget.onToggleComplete,
              ),
              measurable: (habit) => _MeasurableHabitContent(
                habit: habit,
                onProgress: (value) =>
                    widget.onToggleComplete(value >= habit.target),
              ),
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

  final BooleanHabit habit;
  final ValueChanged<bool> onToggle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          habit.emoji,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                habit.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(
                habit.description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                DateFormat('HH:mm').format(habit.time),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
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

  final MeasurableHabit habit;
  final ValueChanged<double> onProgress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              habit.emoji,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    habit.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    habit.description,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            Text(
              '${habit.current.toInt()}/${habit.target.toInt()}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: habit.current / habit.target,
            backgroundColor: habit.color.withOpacity(0.2),
            valueColor: AlwaysStoppedAnimation<Color>(habit.color),
            minHeight: 8,
          ),
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
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: value ? Colors.white : Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(6),
        ),
        child: value
            ? const Icon(
                Icons.check,
                size: 18,
                color: Colors.black,
              )
            : null,
      ),
    );
  }
}
