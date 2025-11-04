import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/features/auth/domain/entites/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.uId, required super.email, required super.name});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      uId: user.uid,
      email: user.email ?? "",
      name: user.displayName ?? "",
    );
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uId: json['uId'],
      email: json['email'],
      name: json['name'],
    );
  }
  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(uId: user.uId, email: user.email, name: user.name);
  }
  toMap() {
    return {'email': email, 'name': name, 'uId': uId};
  }
}
