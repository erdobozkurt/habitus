// lib/core/routes/route_model.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class BaseRoute {
  const BaseRoute({
    required this.path,
    required this.name,
  });
  final String path;
  final String name;
}

class AppRoute extends BaseRoute {
  const AppRoute({
    required super.path,
    required super.name,
    required this.page,
    this.routes = const [],
    this.requiresAuth = false,
  });
  final Widget page;
  final List<RouteBase> routes;
  final bool requiresAuth;
}
