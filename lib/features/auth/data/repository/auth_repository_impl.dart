import 'package:coffee_shop/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  @override
  Future<Either<String, Unit>> signIn(String email, String password) async {
    try {

      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, Unit>> signUp(
      String name, String email, String password) async {
    try {
      return right(unit);
    } catch (e) {
      return left(e.toString());
    }
  }
}
