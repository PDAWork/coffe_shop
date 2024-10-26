import 'package:coffee_shop/core/talker.dart';
import 'package:coffee_shop/features/auth/data/repository/auth_repository_impl.dart';
import 'package:coffee_shop/features/auth/domain/repository/auth_repository.dart';
import 'package:dio/dio.dart';

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

enum _AppDeps { firebase, dio, authRepository }

final class AppDepends {
  AppDepends();

  late final Dio dio;
  late final AuthRepository authRepository;

  Future<void> init({
    required OnError onError,
    required OnProgress onProgress,
  }) async {
    dio = await _addDep(onProgress, onError, _AppDeps.dio, addDepends: () {
      return Dio(
        BaseOptions(
          baseUrl: 'http://localhost:5120/api',
        ),
      );
    });

    dio.get("/Basket/index").then((value) {
      talker.info(value);
    });

    authRepository = await _addDep<AuthRepositoryImpl>(
      onProgress,
      onError,
      _AppDeps.authRepository,
      addDepends: () {
        return AuthRepositoryImpl();
      },
    );
  }

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
