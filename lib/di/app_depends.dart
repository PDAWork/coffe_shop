import 'package:coffee_shop/features/auth/data/repository/auth_repository_impl.dart';
import 'package:coffee_shop/features/auth/domain/repository/auth_repository.dart';
import 'package:coffee_shop/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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

enum _AppDeps { firebase, authRepository }

final class AppDepends {
  AppDepends();

  late final AuthRepository authRepository;

  Future<void> init({
    required OnError onError,
    required OnProgress onProgress,
  }) async {
    await _addDep(
      onProgress,
      onError,
      _AppDeps.firebase,
      isAsync: true,
      addDependsAsync: () async => await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
    );

    authRepository = await _addDep<AuthRepostioryImpl>(
      onProgress,
      onError,
      _AppDeps.authRepository,
      addDepends: () {
        return AuthRepostioryImpl(
          firebaseAuth: FirebaseAuth.instance,
        );
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
