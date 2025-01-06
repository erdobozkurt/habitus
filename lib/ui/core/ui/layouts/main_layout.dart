// lib/core/layouts/main_layout.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/ui/core/ui/layouts/app_bar_settings.dart';
import 'package:habitus/ui/create_habit/widgets/create_habit_modal.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: kThemeAnimationDuration,
        switchInCurve: Curves.ease,
        switchOutCurve: Curves.ease,
        layoutBuilder: (currentChild, previousChildren) {
          return currentChild!;
        },
        child: SizedBox(
          key: ValueKey(navigationShell.currentIndex),
          child: navigationShell,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () => CreateHabitModal.show(context),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 16,
        child: NavigationBar(
          backgroundColor: Colors.transparent,
          onDestinationSelected: (
            index,
          ) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          selectedIndex: navigationShell.currentIndex,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month),
              label: 'Daily',
            ),
            NavigationDestination(
              icon: Icon(Icons.list_alt_outlined),
              selectedIcon: Icon(Icons.list_alt),
              label: 'Dashboard',
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Habitus'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO(erdobozkurt): Implement notifications
            },
          ),
          const AppBarSettings(),
        ],
      ),
    );
  }
}
