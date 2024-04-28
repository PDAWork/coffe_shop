
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

enum _AppDeps {test}

final class AppDepends {
  AppDepends();


  Future<void> init({
    required OnError onError,
    required OnProgress onProgress,
  }) async {}

  Future<T> _addDep<T>(
    OnProgress onProgress,
    OnError onError,
    _AppDeps _appDeps, {
    bool isAsync = false,
    AddDepends? addDepends,
    AddDependsAsync? addDependsAsync,
  }) async {
    try {
      final value = isAsync ? await addDependsAsync!() : addDepends!();
      onProgress(
        _appDeps.name,
        _calc(_appDeps.index),
      );
      return value;
    } on Object catch (error, stackTrace) {
      onError(_appDeps.name, error, stackTrace);
      return throw "${_appDeps.name}, $error, $stackTrace";
    }
  }

  String _calc(int current) =>
      '${((current + 1) / _AppDeps.values.length * 100).toStringAsFixed(0)}%';
}
