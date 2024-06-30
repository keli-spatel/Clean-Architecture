import 'dart:convert';

import 'package:e_commerce_app/Features/Profile/Domain/Entity/Profile_user_Entity.dart';

class ProfileUserModel extends ProfileUserEntity {
  final String userName;
  final String email;

  ProfileUserModel({
    required this.userName,
    required this.email,
  }) : super(
          userName: userName,
          email: email,
        );

  Map<String, dynamic> toMap() {
    return {
      "name": userName,
      "email": email,
    };
  }

  factory ProfileUserModel.fromMap(Map<String, dynamic> fMap) {
    return ProfileUserModel(
      userName: fMap["name"] ?? '',
      email: fMap["email"] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileUserModel.fromJson(String source) =>
      ProfileUserModel.fromMap(jsonDecode(source));
}
