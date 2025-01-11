// lib/domain/repositories/habit_repository.dart
import 'package:habitus/domain/models/habit/habit_model.dart';
import 'package:habitus/domain/models/habit_record/habit_record_model.dart';

abstract class IHabitRepository {
  Future<List<Habit>> getHabits();
  Future<Habit> getHabitById(String id);
  Future<void> createHabit(Habit habit);
  Future<void> updateHabit(Habit habit);
  Future<void> deleteHabit(String id);
  Future<void> saveProgress(String id, double value, {required DateTime date});
  Future<List<HabitRecord>> getAllHabitRecords();
  Future<List<HabitRecord>> getHabitRecordsForDate(DateTime date);
  Future<void> updateHabitRecord(HabitRecord record);
}
