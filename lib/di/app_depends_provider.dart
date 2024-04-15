import 'package:coffee_shop/di/app_depends.dart';
import 'package:flutter/material.dart';

final class AppDependsProvider extends InheritedWidget {
  final AppDepends depends;

  const AppDependsProvider({
    super.key,
    required super.child,
    required this.depends,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static AppDepends of(BuildContext context, [bool listen = false]) {
    final provider = listen
        ? context.dependOnInheritedWidgetOfExactType<AppDependsProvider>()
        : context.getInheritedWidgetOfExactType<AppDependsProvider>();
    assert(provider != null, "Depends not found");
    return provider!.depends;
  }
}
