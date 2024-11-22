// lib/core/routes/app_router.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/core/constants/route_constants.dart';
import 'package:habitus/feature/auth/view/sign_in_page.dart';
import 'package:habitus/feature/auth/view/sign_up_page.dart';
import 'package:habitus/feature/onboard/view/onboarding_page.dart';

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
        builder: (context, state) => const OnboardingPage(),
      ),
      GoRoute(
        path: RouteConstants.signIn,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        path: RouteConstants.signUp,
        builder: (context, state) => const SignUpPage(),
      ),
      // ShellRoute(
      //   builder: (context, state, child) => MainLayout(child: child),
      //   routes: [
      //     GoRoute(
      //       path: RouteConstants.home,
      //       builder: (context, state) => const HomePage(),
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
