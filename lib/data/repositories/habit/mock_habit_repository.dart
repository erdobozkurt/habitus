// lib/data/repositories/mock_habit_repository.dart
import 'package:flutter/material.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';

class MockHabitRepository implements IHabitRepository {
  final List<Habit> _habits = [
    const Habit.boolean(
      id: '1',
      title: 'Morning Meditation',
      question: 'Did you meditate today?',
      repeatDays: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
      emoji: '🧘‍♂️',
    ),
    const Habit.measurable(
      id: '2',
      title: 'Drink Water',
      question: 'Drink 8 glasses of water',
      repeatDays: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
      target: 8,
      emoji: '💧',
      color: Colors.purple,
    ),
    const Habit.measurable(
      id: '3',
      title: 'Read a Book',
      question: 'How many pages did you read?',
      repeatDays: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
      reminderTime: TimeOfDay(hour: 20, minute: 0),
      target: 20,
      current: 10,
      emoji: '📚',
      color: Colors.orange,
    ),
    const Habit.boolean(
      id: '4',
      title: 'Workout',
      question: 'Did you workout today?',
      repeatDays: ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
      emoji: '🏋️‍♂️',
      color: Colors.green,
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
}
