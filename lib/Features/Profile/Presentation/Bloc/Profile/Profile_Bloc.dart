import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/Features/Profile/Data/Model/Profile_user_Model.dart';
import 'package:e_commerce_app/Features/Profile/Domain/Entity/Profile_user_Entity.dart';

import '../../../Domain/Usecase/Get_single_user_data_Usecase.dart';
import 'Profile_Event.dart';
import 'Profile_State.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetSingleUserDataUsecase getSingleUserDataUsecase;

  ProfileBloc({required this.getSingleUserDataUsecase})
      : super(
          SingleUserDataLoadedState(
            profileUserEntity: ProfileUserEntity(email: '', userName: ''),
          ),
        ) {
    on<GetSingleUserDataEvent>((event, emit) async {
      emit(ProfileLoadingState());

      final result = await getSingleUserDataUsecase.call(
        ProfileUserEntity(userName: "userName", email: "email"),
      );

      result.fold(
        (failure) => emit(ProfileErrorState(
            errorMessage: "${failure.message}:${failure.statusCode}")),
        (success) => emit(
          SingleUserDataLoadedState(
            profileUserEntity: success,
          ),
        ),
      );
    });
  }
}
