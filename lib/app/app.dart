import 'package:coffee_shop/common/theme_data.dart';
import 'package:coffee_shop/di/app_depends.dart';
import 'package:coffee_shop/di/app_depends_provider.dart';
import 'package:coffee_shop/router/app_router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key, required this.depends});

  final AppDepends depends;

  @override
  Widget build(BuildContext context) {
    return AppDependsProvider(child: const _App(), depends: depends);
  }
}

class _App extends StatelessWidget {
  const _App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: themeDataLigth,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}
