// lib/data/repositories/mock_habit_repository.dart
import 'package:flutter/material.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';

class MockHabitRepository implements IHabitRepository {
  final List<Habit> _habits = [
    const Habit(
      id: '1',
      title: 'Morning Meditation',
      question: 'Did you meditate today?',
      repeatDays: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
      emoji: '🧘‍♂️',
    ),
    const Habit(
      id: '2',
      title: 'Drink Water',
      type: HabitType.measurable,
      question: 'Drink 8 glasses of water',
      repeatDays: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
      target: 8,
      emoji: '💧',
      color: Colors.purple,
    ),
    const Habit(
      id: '3',
      title: 'Read a Book',
      type: HabitType.measurable,
      question: 'How many pages did you read?',
      repeatDays: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
      reminderTime: TimeOfDay(hour: 20, minute: 0),
      target: 20,
      current: 10,
      emoji: '📚',
      color: Colors.orange,
    ),
    const Habit(
      id: '4',
      title: 'Workout',
      question: 'Did you workout today?',
      repeatDays: ['Monday', 'Wednesday', 'Thursday'],
      emoji: '🏋️‍♂️',
      color: Colors.green,
    ),
    const Habit(
      id: '5',
      title: 'Journaling',
      question: 'Did you journal today?',
      repeatDays: ['Monday', 'Wednesday', 'Friday'],
      emoji: '📝',
      color: Colors.red,
    ),
    const Habit(
      id: '6',
      title: 'Rest Well',
      question: 'Did you eat healthy today?',
      repeatDays: ['Sunday'],
      emoji: '🥗',
      color: Colors.pink,
    ),
  ];

  @override
  Future<List<Habit>> getHabits() async {
    // Simulate network delay
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return _habits;
  }

  @override
  Future<Habit> getHabitById(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return _habits.firstWhere(
      (habit) => habit.id == id,
      orElse: () => throw Exception('Habit not found'),
    );
  }

  @override
  Future<void> createHabit(Habit habit) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    _habits.add(habit);
  }

  @override
  Future<void> updateHabit(Habit habit) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final index = _habits.indexWhere((h) => h.id == habit.id);
    if (index != -1) {
      _habits[index] = habit;
    } else {
      throw Exception('Habit not found');
    }
  }

  @override
  Future<void> deleteHabit(String id) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    _habits.removeWhere((habit) => habit.id == id);
  }

  @override
  Future<void> saveProgress(String id, double value) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final index = _habits.indexWhere((h) => h.id == id);
    if (index != -1) {
      final habit = _habits[index];
      if (habit.type == HabitType.measurable) {
        _habits[index] = habit.copyWith(current: value);
      } else {
        throw Exception('Habit is not measurable');
      }
    } else {
      throw Exception('Habit not found');
    }
  }
}
