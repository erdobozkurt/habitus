// lib/core/layouts/main_layout.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/router/route_constants.dart';
import 'package:habitus/ui/create_habit/widgets/create_habit_modal.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
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
          onDestinationSelected: (index) {
            switch (index) {
              case 0:
                context.go(RouteConstants.home);
              case 1:
                context.go(RouteConstants.routines);
              case 2:
                context.go(RouteConstants.profile);
            }
          },
          selectedIndex: _calculateSelectedIndex(context),
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Icons.list_alt_outlined),
              selectedIcon: Icon(Icons.list_alt),
              label: 'Routines',
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
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: () {
              // TODO(erdobozkurt): Implement settings
            },
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    if (location.startsWith(RouteConstants.home)) return 0;
    if (location.startsWith(RouteConstants.routines)) return 1;
    if (location.startsWith(RouteConstants.profile)) return 2;
    return 0;
  }
}
