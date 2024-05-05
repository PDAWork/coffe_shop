import 'package:dartz/dartz.dart';

abstract interface class AuthRepository {
  Future<Either<String, Unit>> signIn(String email, String password);
  Future<Either<String, Unit>> signUp(String name,String email, String password);
}
