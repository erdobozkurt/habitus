// lib/core/routes/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/ui/auth/widgets/sign_in_screen.dart';
import 'package:habitus/ui/auth/widgets/sign_up_screen.dart';
import 'package:habitus/ui/core/themes/constants/route_constants.dart';
import 'package:habitus/ui/core/ui/layouts/main_layout.dart';
import 'package:habitus/ui/home/widgets/home_screen.dart';
import 'package:habitus/ui/onboard/widgets/onboarding_screen.dart';
import 'package:habitus/ui/profile/widgets/profile_screen.dart';
import 'package:habitus/ui/routines/widgets/routines_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteConstants.onboarding,
    routes: [
      // GoRoute(
      //   path: RouteConstants.splash,
      //   builder: (context, state) => const SplashPage(),
      // ),
      GoRoute(
        path: RouteConstants.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RouteConstants.signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: RouteConstants.signUp,
        builder: (context, state) => const SignUpPage(),
      ),
      ShellRoute(
        builder: (context, state, child) => MainLayout(child: child),
        routes: [
          GoRoute(
            path: RouteConstants.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: RouteConstants.routines,
            builder: (context, state) => const RoutinesPage(),
          ),
          GoRoute(
            path: RouteConstants.profile,
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
    redirect: (context, state) async {
      return null;

      // TODO(erdobozkurt): Auth guard implementation
      // final isLoggedIn = await AuthService.instance.isLoggedIn();
      // final isGoingToLogin = state.uri.path == RouteConstants.signIn;

      // if (!isLoggedIn && !isGoingToLogin) {
      //   return RouteConstants.signIn;
      // }

      // return null;
    },
  );
}
