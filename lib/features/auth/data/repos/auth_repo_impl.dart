import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/errors/exptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/service/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exption in createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما , يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exption in signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما , يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exption in signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما , يرجى المحاولة مرة أخرى'));
    }
  }
}
