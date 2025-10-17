import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/errors/exptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exption in firebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'هذا البريد الإلكتروني مستخدم بالفعل');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomException(message: 'حدث خطأ ما , يرجى المحاولة مرة أخرى');
      }
    } catch (e) {
      log(
        'Exption in firebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(message: 'حدث خطأ ما , يرجى المحاولة مرة أخرى');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log(
        'Exption in firebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );
      if (e.code == 'user-not-found') {
        throw CustomException(
          message: 'كلمة المرور او البريد الالكتروني غير صحيحة',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(
          message: 'كلمة المرور أو البريد الالكتروني غير صحيحة',
        );
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'لا يوجد اتصال بالانترنت');
      } else {
        throw CustomException(message: 'حدث خطأ ما , يرجى المحاولة مرة أخرى');
      }
    } catch (e) {
      log(
        'Exption in firebaseAuthService.signInWithEmailAndPassword: ${e.toString()}',
      );
      throw CustomException(message: 'حدث خطأ ما , يرجى المحاولة مرة أخرى');
    }
  }
}
