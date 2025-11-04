import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exptions.dart';
import 'package:fruit_hub/core/errors/failures.dart';
import 'package:fruit_hub/core/service/database_service.dart';
import 'package:fruit_hub/core/service/firebase_auth_service.dart';
import 'package:fruit_hub/core/service/shared_preferences_singleton.dart';
import 'package:fruit_hub/core/utils/backend_endpoint.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entites/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

import '../../../../constans.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.databaseService,
    required this.firebaseAuthService,
  });

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(ServerFailure(e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exption in createUserWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما , يرجى المحاولة مرة أخرى'));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) await firebaseAuthService.deleteUser();
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
      var userEntity = await getUserData(uId: user.uid);
      await saveUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(e.message));
    } catch (e) {
      log('Exption in signInWithEmailAndPassword: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما , يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfUserExists(
        path: BackendEndpoint.isUserExist,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exption in signInWithGoogle: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما , يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User? user;
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExist = await databaseService.checkIfUserExists(
        path: BackendEndpoint.isUserExist,
        documentId: user.uid,
      );
      if (isUserExist) {
        await getUserData(uId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }

      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exption in signInWithFacebook: ${e.toString()}');
      return left(ServerFailure('حدث خطأ ما , يرجى المحاولة مرة أخرى'));
    }
  }

  @override
  Future addUserData({required UserEntity user}) async {
    await databaseService.addData(
      path: BackendEndpoint.addUserData,
      data: UserModel.fromEntity(user).toMap(),
      documentId: user.uId,
    );
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    var userData = await databaseService.getData(
      path: BackendEndpoint.getUserData,
      documentId: uId,
    );
    return UserModel.fromJson(userData);
  }

  @override
  Future saveUserData({required UserEntity user}) async {
    var jsonData = jsonEncode(UserModel.fromEntity(user).toMap());
    await Prefs.setString(kUserData, jsonData);
  }
}
