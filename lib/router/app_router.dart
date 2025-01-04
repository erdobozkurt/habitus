import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/router/route_constants.dart';
import 'package:habitus/ui/core/ui/layouts/main_layout.dart';
import 'package:habitus/ui/home/widgets/home_screen.dart';
import 'package:habitus/ui/onboard/cubit/onboard_cubit.dart';
import 'package:habitus/ui/onboard/widgets/onboarding_screen.dart';
import 'package:habitus/ui/routines/widgets/routines_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteConstants.onboarding,
    routes: [
      GoRoute(
        path: '/',
        redirect: (_, __) => RouteConstants.onboarding,
      ),
      GoRoute(
        path: RouteConstants.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      // ShellRoute(
      //   builder: (context, state, child) => MainLayout(child: child),
      //   routes: [
      //     GoRoute(
      //       path: RouteConstants.home,
      //       builder: (context, state) => const HomeScreen(),
      //     ),
      //     GoRoute(
      //       path: RouteConstants.routines,
      //       builder: (context, state) => const RoutinesPage(),
      //     ),
      //     GoRoute(
      //       path: RouteConstants.profile,
      //       builder: (context, state) => const ProfilePage(),
      //     ),
      //   ],
      // ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state, navigationShell) =>
            MainLayout(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConstants.home,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: HomeScreen()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RouteConstants.routines,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: RoutinesScreen()),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      final onboardCubit = context.read<OnboardCubit>();

      // Check onboard status only if not checked yet
      if (!onboardCubit.state.isChecked) {
        await onboardCubit.checkOnboardStatus();
      }

      // Allow navigation within app if onboarded
      if (onboardCubit.state.isOnboarded) {
        return state.uri.path == RouteConstants.onboarding
            ? RouteConstants.home
            : null;
      }

      // Force onboarding if not onboarded
      return RouteConstants.onboarding;
    },
  );
}
