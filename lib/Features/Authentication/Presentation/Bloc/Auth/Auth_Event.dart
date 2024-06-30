abstract class AuthEvent {}

class SignUpUserEvent extends AuthEvent {
  final String email;
  final String password;
  final String name;

  SignUpUserEvent({
    required this.email,
    required this.password,
    required this.name,
  });
}

class SignInUserEvent extends AuthEvent {
  final String email;
  final String password;

  SignInUserEvent({
    required this.email,
    required this.password,
  });
}

class CheckUserIsLoggedInEvent extends AuthEvent {}
