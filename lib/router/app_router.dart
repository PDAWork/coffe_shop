import 'package:coffee_shop/features/auth/presentation/ui/sing_in_screen.dart';
import 'package:coffee_shop/features/auth/presentation/ui/sing_up_screen.dart';
import 'package:coffee_shop/features/auth/presentation/ui/welcome_screen.dart';
import 'package:coffee_shop/features/home/presentation/ui/home_screen.dart';
import 'package:coffee_shop/router/router_utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: Pages.welcomeScreen.screenPath,
        name: Pages.welcomeScreen.screenName,
        builder: (context, state) {
          return const WelcomeScreen();
        },
        routes: [
          GoRoute(
            path: Pages.singInScreen.screenPath,
            name: Pages.singInScreen.screenName,
            builder: (context, state) {
              return const SingInScreen();
            },
          ),
          GoRoute(
            path: Pages.signUpScreen.screenPath,
            name: Pages.signUpScreen.screenName,
            builder: (context, state) {
              return const SingUpScreen();
            },
          ),
        ],
      ),
      GoRoute(
        path: Pages.homeScreen.screenPath,
        name: Pages.homeScreen.screenName,
        builder: (context, state) {
          return const HomeScreen();
        },
      )
    ],
  );
}
