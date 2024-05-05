import 'package:coffee_shop/common/firebase_error_message_auth.dart';
import 'package:coffee_shop/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepostioryImpl implements AuthRepository {
  AuthRepostioryImpl({required this.firebaseAuth});

  final FirebaseAuth firebaseAuth;
  @override
  Future<Either<String, Unit>> signIn(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(authErrors[e.code] ?? '');
    }
  }

  @override
  Future<Either<String, Unit>> signUp(
      String name, String email, String password) async {
    try {
      final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await result.user?.updateDisplayName(name);
      return right(unit);
    } on FirebaseAuthException catch (e) {
      return left(authErrors[e.code] ?? '');
    }
  }
}
