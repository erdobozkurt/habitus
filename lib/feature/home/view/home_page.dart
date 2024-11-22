import 'package:flutter/material.dart';
import 'package:habitus/core/models/routine_model.dart';
import 'package:habitus/ui_kit/cards/routine_cards.dart';
import 'package:habitus/ui_kit/pickers/custom_date_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectedDate = DateTime.now();
  final List<Routine> _routines = [
    Routine(
      id: '1',
      title: 'Morning Meditation',
      description: 'Start the day mindfully',
      time: DateTime.now().copyWith(hour: 7, minute: 0),
      emoji: '🧘‍♂️',
      color: const Color(0xFF6B4EFF),
    ),
    Routine(
      id: '2',
      title: 'Read a Book',
      description: 'Daily reading habit',
      time: DateTime.now().copyWith(hour: 20, minute: 0),
      emoji: '📚',
      color: const Color(0xFF4ECBFF),
    ),
    Routine(
      id: '3',
      title: 'Workout',
      description: 'Stay healthy',
      time: DateTime.now().copyWith(hour: 18, minute: 0),
      emoji: '💪',
      color: const Color(0xFFFF4E4E),
    ),
  ];

  void _handleDateSelected(DateTime date) {
    setState(() => _selectedDate = date);
  }

  void _handleRoutineToggle(String routineId, bool completed) {
    setState(() {
      final index = _routines.indexWhere((r) => r.id == routineId);
      if (index != -1) {
        _routines[index] = Routine(
          id: _routines[index].id,
          title: _routines[index].title,
          description: _routines[index].description,
          time: _routines[index].time,
          emoji: _routines[index].emoji,
          color: _routines[index].color,
          isCompleted: completed,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          CustomDatePicker(
            selectedDate: _selectedDate,
            onDateSelected: _handleDateSelected,
            firstDate: DateTime.now().subtract(const Duration(days: 3)),
            lastDate: DateTime.now().add(const Duration(days: 3)),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: _routines.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final routine = _routines[index];
                return RoutineCard(
                  routine: routine,
                  onToggleComplete: (completed) =>
                      _handleRoutineToggle(routine.id, completed),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
