import 'dart:async';
import 'dart:developer';

import 'package:coffee_shop/app/app.dart';
import 'package:coffee_shop/app/app_env.dart';
import 'package:coffee_shop/di/app_depends.dart';
import 'package:flutter/material.dart';

class AppRunner {
  final AppEnv _env;

  AppRunner(this._env);

  Future<void> run() async {
    runZonedGuarded(() async {
      await _initApp();
      final di = AppDepends(_env);
      await di.init(
        onError: (name, error, stackTrace) {
          throw '$name, $error, $stackTrace';
        },
        onProgress: (name, progress) {
          log("Init $name success $progress", sequenceNumber: 0);
        },
      );

      runApp(App(depends: di));
    }, (error, stack) {
      log(error.toString(), stackTrace: stack, error: error);
      runApp(_AppError(
        message: 'error: $error,\n stack: $stack',
      ));
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

class _AppError extends StatelessWidget {
  const _AppError({
    super.key,
    required this.message,
  });

  final String message;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text(message)),
      ),
    );
  }
}
