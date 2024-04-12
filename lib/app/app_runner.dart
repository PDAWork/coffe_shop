import 'dart:async';
import 'dart:developer';

import 'package:coffee_shop/app/app_env.dart';
import 'package:coffee_shop/common/app_color.dart';
import 'package:coffee_shop/common/theme_data.dart';
import 'package:coffee_shop/di/app_depends.dart';
import 'package:coffee_shop/router/app_router.dart';
import 'package:flutter/material.dart';

class AppRunner {
  final AppEnv _env;

  AppRunner(this._env);

  Future<void> run() async {
    runZonedGuarded(() async {
      await _initApp();

      final di = await AppDepends(_env).init();

      runApp(
        MaterialApp.router(
          theme: themeDataLigth,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
        ),
      );
    }, (error, stack) {
      log(error.toString(), stackTrace: stack, error: error);
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      WidgetsBinding.instance.allowFirstFrame();
    });
  }

  Future<void> _initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance.deferFirstFrame();
  }
}
