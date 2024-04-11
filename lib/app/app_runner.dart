import 'dart:async';
import 'dart:developer';

import 'package:coffee_shop/app/app_env.dart';
import 'package:flutter/material.dart';

class AppRunner {
  final AppEnv _env;

  AppRunner(this._env);

  Future<void> run() async {
    runZonedGuarded(() async {
      await _initApp();
      runApp(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text(_env.toString()),
            ),
          ),
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
