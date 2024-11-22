import 'dart:math';

import 'package:confetti/confetti.dart';
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
  late final ConfettiController _confettiController;
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

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
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

        if (completed) {
          _confettiController.play();
        }
      }
    });
  }

  Path _drawStar(Size size) {
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (var step = 0.0; step < fullAngle; step += degreesPerStep) {
      path
        ..lineTo(
          halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step),
        )
        ..lineTo(
          halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep),
        );
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(title: const Text('Home')),
          body: Column(
            children: [
              CustomDatePicker(
                selectedDate: _selectedDate,
                onDateSelected: _handleDateSelected,
              ),
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
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: pi / 2,
            maxBlastForce: 5,
            minBlastForce: 2,
            emissionFrequency: 0.05,
            numberOfParticles: 50,
            gravity: 0.1,
            createParticlePath: _drawStar,
          ),
        ),
      ],
    );
  }

  void _handleDateSelected(DateTime value) {
    setState(() {
      _selectedDate = value;
    });
  }
}
