import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/router/route_constants.dart';

class NavigationService {
  NavigationService._();
  static final NavigationService _instance = NavigationService._();
  static NavigationService get instance => _instance;

  void goToHome(BuildContext context) {
    _safePush(context, () => context.go(RouteConstants.home));
  }

  // void goToSignIn(BuildContext context) {
  //   _safePush(context, () => context.go(RouteConstants.signIn));
  // }

  void goToProfile(BuildContext context) {
    _safePush(context, () => context.go(RouteConstants.profile));
  }

  void pop(BuildContext context) {
    if (context.canPop()) {
      context.pop();
    }
  }

  Future<T?> pushNamed<T>(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return context.pushNamed<T>(routeName, extra: arguments);
  }

  void _safePush(BuildContext context, VoidCallback navigate) {
    try {
      navigate();
    } catch (e) {
      debugPrint('Navigation error: $e');
      // Optional: Show error dialog or snackbar
    }
  }
}

// Usage example:
// NavigationService.instance.goToHome(context);
