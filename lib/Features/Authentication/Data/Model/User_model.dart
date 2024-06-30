import 'dart:convert';

import 'package:e_commerce_app/Features/Authentication/Domain/Entity/User_Entity.dart';

class UserModel extends UserEntity {
  final String? id;
  final String? name;
  final String? email;
  final String? password;
  final String? address;
  final String? type;
  final String? token;
  final List<dynamic>? cart;

  const UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.address,
    this.type,
    this.token,
    this.cart,
  }) : super(
          id: id,
          name: name,
          email: email,
          password: password,
          address: address,
          type: type,
          token: token,
          cart: cart,
        );

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? password,
    String? address,
    String? type,
    String? token,
    List<dynamic>? cart,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      address: address ?? this.address,
      type: type ?? this.type,
      token: token ?? this.token,
      cart: cart ?? this.cart,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token,
      'cart': cart,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> fMap) {
    return UserModel(
      id: fMap["_id"] ?? "",
      name: fMap["name"] ?? "",
      email: fMap["email"] ?? "",
      password: fMap["password"] ?? "",
      address: fMap["address"] ?? "",
      type: fMap["type"] ?? "",
      token: fMap["token"] ?? "",
    /**  cart: List<Map<String, dynamic>>.from(
        fMap["cart"]?.map((x) => Map<String, dynamic>.from(x)),
      ),**/

    );
  }
  String toJson() => jsonEncode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromJson(jsonDecode(source));
}
