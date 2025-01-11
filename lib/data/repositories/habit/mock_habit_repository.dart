// lib/data/repositories/mock_habit_repository.dart
import 'package:flutter/material.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';
import 'package:habitus/domain/models/habit_record/habit_record_model.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';

class MockHabitRepository implements IHabitRepository {
  static final List<Habit> _habits = [
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

  final List<HabitRecord> _additionalMockRecords = [
    // Add more records spanning multiple days for better chart data
    HabitRecord(
      habit: _habits[1],
      date: DateTime.now().subtract(const Duration(days: 1)),
      isCompleted: true,
      value: 8,
    ),
    HabitRecord(
      habit: _habits[1],
      date: DateTime.now().subtract(const Duration(days: 2)),
      isCompleted: true,
      value: 8,
    ),
    HabitRecord(
      habit: _habits[2],
      date: DateTime.now().subtract(const Duration(days: 1)),
      isCompleted: true,
      value: 20,
    ),
    HabitRecord(
      habit: _habits[2],
      date: DateTime.now().subtract(const Duration(days: 2)),
      isCompleted: false,
      value: 10,
    ),
    // Add more as needed
  ];

  late final Map<String, HabitRecord> _habitRecords = {
    '2_2025-01-10': HabitRecord(
      habit: _habits[1],
      date: DateTime(2025, 1, 10),
      isCompleted: true,
      value: 8,
    ),
    '2_2025-01-09': HabitRecord(
      habit: _habits[1],
      date: DateTime(2025, 1, 9),
      isCompleted: false,
      value: 3,
    ),
    '3_2025-01-10': HabitRecord(
      habit: _habits[2],
      date: DateTime(2025, 1, 10),
      isCompleted: true,
      value: 25,
    ),
    '3_2025-01-09': HabitRecord(
      habit: _habits[2],
      date: DateTime(2025, 1, 9),
      isCompleted: false,
      value: 15,
    ),
    '1_2025-01-10': HabitRecord(
      habit: _habits[0],
      date: DateTime(2025, 1, 10),
      isCompleted: true,
    ),
    '1_2025-01-09': HabitRecord(
      habit: _habits[0],
      date: DateTime(2025, 1, 9),
      isCompleted: false,
    ),
    for (var record in _additionalMockRecords)
      '${record.habit.id}_${record.date.toIso8601String().split('T')[0]}':
          record,
  };

  String _generateRecordKey(String habitId, DateTime date) {
    final dateKey = date.toIso8601String().split('T')[0];
    return '${habitId}_$dateKey';
  }

  @override
  Future<List<Habit>> getHabits() async {
    await Future<void>.delayed(const Duration(milliseconds: 800));
    return _habits;
  }

  @override
  Future<List<HabitRecord>> getHabitRecordsForDate(DateTime date) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));

    return _habits.map((habit) {
      final recordKey = _generateRecordKey(habit.id, date);
      return _habitRecords[recordKey] ??
          HabitRecord(
            habit: habit,
            date: date,
            isCompleted: false,
          );
    }).toList();
  }

  @override
  Future<void> updateHabitRecord(HabitRecord record) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final recordKey = _generateRecordKey(record.habit.id, record.date);
    _habitRecords[recordKey] = record;
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
  Future<void> saveProgress(
    String id,
    double value, {
    required DateTime date,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    final habit = await getHabitById(id);
    if (habit.type != HabitType.measurable) {
      throw Exception('Habit is not measurable');
    }

    final dateKey = date.toIso8601String().split('T')[0];
    final recordKey = '${id}_$dateKey';

    final existingRecord = _habitRecords[recordKey];
    final updatedRecord = (existingRecord ??
            HabitRecord(
              habit: habit,
              date: date,
              isCompleted: false,
            ))
        .copyWith(
      value: value,
      isCompleted: value >= habit.target,
    );

    _habitRecords[recordKey] = updatedRecord;
  }

  @override
  Future<List<HabitRecord>> getAllHabitRecords() async {
    await Future<void>.delayed(const Duration(milliseconds: 500));
    return _habitRecords.values.toList();
  }
}
