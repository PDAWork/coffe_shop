import 'package:bloc/bloc.dart';
import 'package:coffee_shop/features/auth/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  final AuthRepository authRepository;

  Future<void> singIn({
    required String email,
    required String password,
  }) async {
    final result = await authRepository.signIn(email, password);
    result.fold(
      (message) {
        emit(AuthError(message: message));
        emit(AuthInitial());
      },
      (_) => emit(AuthSuccess()),
    );
  }

  Future<void> singUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final result = await authRepository.signUp(name, email, password);
    result.fold(
      (message) {
        emit(AuthError(message: message));
        emit(AuthInitial());
      },
      (_) => emit(AuthSuccess()),
    );
  }
}
