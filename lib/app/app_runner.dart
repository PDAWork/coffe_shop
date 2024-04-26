import 'dart:async';

import 'package:coffee_shop/app/app.dart';
import 'package:coffee_shop/app/app_env.dart';
import 'package:coffee_shop/core/talker.dart';
import 'package:coffee_shop/core/my_global_observer.dart';
import 'package:coffee_shop/di/app_depends.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger.dart';

class AppRunner {
  final AppEnv _env;

  AppRunner(this._env);

  Future<void> run() async {
    runZonedGuarded(() async {
      await _initApp();
      Bloc.observer = MyGlobalObserver(
        talker: talker,
        settings: const TalkerBlocLoggerSettings(),
      );
      FlutterError.onError =
          (details) => talker.handle(details.exception, details.stack);

      final di = AppDepends();
      await di.init(
        onError: (name, error, stackTrace) {
          throw '$name, $error, $stackTrace';
        },
        onProgress: (name, progress) {
          talker.info("Init $name success $progress");
        },
      );

      runApp(App(depends: di));
    }, (error, stack) {
      talker.handle(error.toString(), stack);
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
  const _AppError({required this.message});

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
