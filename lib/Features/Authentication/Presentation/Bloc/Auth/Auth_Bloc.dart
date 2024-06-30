import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Failure/Failure.dart';
import 'package:e_commerce_app/Features/Authentication/Domain/Entity/User_Entity.dart';
import 'package:e_commerce_app/Features/Authentication/Presentation/Bloc/Auth/Auth_State.dart';
import '../../../Domain/Usecase/Get_user_data_Usecase.dart';
import '../../../Domain/Usecase/Is_logged_in_user_Usecase.dart';
import '../../../Domain/Usecase/Sign_in_user_Usecase.dart';
import '../../../Domain/Usecase/Sign_up_user_Usecase.dart';
import 'Auth_Event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignUpUserUsecase signUpUserUsecase;
  final SignInUserUsecase signInUserUsecase;
  final IsLoggedInUserUsecase isLoggedInUserUsecase;
  final GetUserDataUsecase getUserData;
  AuthBloc({
    required this.signUpUserUsecase,
    required this.signInUserUsecase,
    required this.isLoggedInUserUsecase,
    required this.getUserData,
  }) : super(AuthLoadedState()) {

    on<SignUpUserEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await signUpUserUsecase.call(UserEntity(
        email: event.email,
        password: event.password,
        name: event.name,
      ));

      result.fold(
        (failure) => emit(
          AuthErrorState(
              authError: "${failure.message}: ${failure.statusCode}"),
        ),
        (success) => emit(
          AuthLoadedState(),
        ),
      );
    });


    on<SignInUserEvent>((event, emit) async {
      emit(AuthLoadingState());

      final result = await signInUserUsecase.call(UserEntity(
        email: event.email,
        password: event.password,
      ));

      result.fold(
        (failure) => emit(
          AuthErrorState(
              authError: "${failure.message}: ${failure.statusCode}"),
        ),
        (success) => emit(
          AuthLoadedState(),
        ),
      );
    });

    //
    on<CheckUserIsLoggedInEvent>((event, emit) async {
      emit(AuthLoadingState());
      final Either<Failure, bool> isLoggedIn =
          await isLoggedInUserUsecase.call();

      isLoggedIn.fold(
        (failure) => emit(UserNotLoggedInState()),
        (isLoggedIn) => isLoggedIn
            ? emit(UserLoggedInState())
            : emit(UserNotLoggedInState()),
      );
    });
  }
}

//
// import 'package:bloc/bloc.dart';
// import 'package:e_commerce_app/Features/Authentication/Domain/Entity/User_Entity.dart';
// import 'package:e_commerce_app/Features/Authentication/Presentation/Bloc/Auth_State.dart';
// import '../../Domain/Usecase/Sign_in_user_Usecase.dart';
// import '../../Domain/Usecase/Sign_up_user_Usecase.dart';
// import 'Auth_Event.dart';
//
// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   final SignUpUserUsecase signUpUserUsecase;
//   final SignInUserUsecase signInUserUsecase;
//   AuthBloc({
//     required this.signUpUserUsecase,
//     required this.signInUserUsecase,
//   }) : super(AuthState()) {
//     //
//     on<SignUpUserEvent>((event, emit) async {
//       await signUpUserUsecase.call(UserEntity(
//         email: event.email,
//         password: event.password,
//         name: event.name,
//       ));
//       emit(AuthState());
//     });
//
//     //
//     on<SignInUserEvent>((event, emit) async {
//       await signInUserUsecase.call(UserEntity(
//         email: event.email,
//         password: event.password,
//       ));
//       emit(AuthState());
//     });
//   }
// }


