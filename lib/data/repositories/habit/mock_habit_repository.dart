// lib/data/repositories/mock_habit_repository.dart
import 'package:flutter/material.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';

class MockHabitRepository implements IHabitRepository {
  final List<Habit> _habits = [
    Habit.boolean(
      id: '1',
      title: 'Morning Meditation',
      description: '10 minutes meditation',
      time: DateTime.now(),
      emoji: '🧘‍♂️',
    ),
    Habit.measurable(
      id: '2',
      title: 'Drink Water',
      description: 'Drink 8 glasses of water',
      time: DateTime.now(),
      target: 8,
      emoji: '💧',
      color: Colors.purple,
    ),
    Habit.measurable(
      id: '3',
      title: 'Read a Book',
      description: 'Read 20 pages of a book',
      time: DateTime.now(),
      target: 20,
      emoji: '📚',
      color: Colors.orange,
    ),
    Habit.boolean(
      id: '4',
      title: 'Workout',
      description: '30 minutes workout',
      time: DateTime.now(),
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
