import 'dart:developer';
import 'dart:math' hide log;

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/domain/enums/status.dart';
import 'package:habitus/ui/core/themes/constants/padding_constants.dart';
import 'package:habitus/ui/home/cubit/home_cubit.dart';
import 'package:habitus/ui/home/widgets/custom_date_picker.dart';
import 'package:habitus/ui/home/widgets/habit_cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ConfettiController _confettiController;
  DateTime _selectedDate = DateTime.now();

  static const Map<int, String> weekDayNames = {
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday',
  };

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
    context.read<HomeCubit>().loadHabitsForDate(_selectedDate);
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
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

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
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
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.status == Status.loading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        }

        if (state.status == Status.error) {
          return const Center(child: Text('An error occurred'));
        }

        final currentWeekDay = weekDayNames[_selectedDate.weekday] ?? '';
        log('Current weekday: $currentWeekDay (${_selectedDate.weekday})');

        final filteredHabits = state.habitRecords.where((record) {
          final weekDay = weekDayNames[_selectedDate.weekday]!;
          return record.habit.repeatDays.contains(weekDay);
        }).toList();

        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(title: const Text('Home')),
              body: Column(
                children: [
                  CustomDatePicker(
                    selectedDate: _selectedDate,
                    onDateSelected: _handleDateSelected,
                  ),
                  if (filteredHabits.isEmpty)
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text('No habits scheduled for today'),
                    )
                  else
                    Expanded(
                      child: ListView.separated(
                        padding: PaddingConstants.listItemPadding,
                        itemCount: filteredHabits.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final record = filteredHabits[index];
                          return HabitCard(
                            record: record,
                            onToggleComplete: (completed) {
                              context
                                  .read<HomeCubit>()
                                  .toggleHabitCompletion(record)
                                  .then((_) {
                                if (completed) {
                                  _confettiController.play();
                                }
                              });
                            },
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
      },
    );
  }

  void _handleDateSelected(DateTime value) {
    if (!mounted) return;
    setState(() {
      _selectedDate = value;
    });
    context.read<HomeCubit>().optimisticLoadHabitsForDate(value);
  }
}
