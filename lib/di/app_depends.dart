typedef OnError = void Function(
  String name,
  Object error,
  StackTrace? stackTrace,
);

typedef OnProgress = void Function(
  String name,
  String progress,
);

typedef AddDependsAsync<T> = Future<T> Function();
typedef AddDepends<T> = T Function();

enum _AppDeps { test }

final class AppDepends {
  AppDepends();

  Future<void> init({
    required OnError onError,
    required OnProgress onProgress,
  }) async {}

  Future<T> _addDep<T>(
    OnProgress onProgress,
    OnError onError,
    _AppDeps appDeps, {
    bool isAsync = false,
    AddDepends? addDepends,
    AddDependsAsync? addDependsAsync,
  }) async {
    try {
      final value = isAsync ? await addDependsAsync!() : addDepends!();
      onProgress(
        appDeps.name,
        _calc(appDeps.index),
      );
      return value;
    } on Object catch (error, stackTrace) {
      onError(appDeps.name, error, stackTrace);
      return throw "${appDeps.name}, $error, $stackTrace";
    }
  }

  String _calc(int current) =>
      '${((current + 1) / _AppDeps.values.length * 100).toStringAsFixed(0)}%';
}
