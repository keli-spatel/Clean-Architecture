class AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {}

class AuthErrorState extends AuthState {
  final String authError;

  AuthErrorState({required this.authError});
}

// class UserLoggedInState extends AuthState {}
//
// class UserNotLoggedInState extends AuthState {}
