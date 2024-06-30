import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? id;
  final String? email;
  final String? password;
  final String? name;
  final String? address;
  final String? type;
  final String? token;
  final List<dynamic>? cart;

  const UserEntity({
    this.id,
    this.email,
    this.password,
    this.name,
    this.address,
    this.type,
    this.token,
    this.cart,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        password,
        name,
        address,
        type,
        token,
        cart,
      ];
}
