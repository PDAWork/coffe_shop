import 'package:coffee_shop/app/app_env.dart';
import 'package:coffee_shop/core/state_managment/cubit/app_bottom_navigation_bar_cubit.dart';

typedef OnError = void Function(
  String name,
  Object error,
  StackTrace? stackTrace,
);

typedef OnProgress = void Function(
  String name,
  String progress,
);

enum _AppDeps {
  appBottomNavigationBarCubit,
}

final class AppDepends {
  final AppEnv _env;

  late final AppBottomNavigationBarCubit appBottomNavigationBarCubit;

  AppDepends(this._env);

  Future<void> init({
    required OnError onError,
    required OnProgress onProgress,
  }) async {
    try {
      appBottomNavigationBarCubit = AppBottomNavigationBarCubit();
      onProgress(
        "appBottomNavigationBarCubit",
        _calc(
          _AppDeps.appBottomNavigationBarCubit.index,
          _AppDeps.values.length,
        ),
      );
    } on Object catch (error, stackTrace) {
      onError("appBottomNavigationBarCubit", error, stackTrace);
    }
  }

  String _calc(int current, int max) =>
      '${((current + 1 / max) * 100).toStringAsFixed(0)}%';
}
