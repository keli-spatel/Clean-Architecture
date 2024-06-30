import 'package:e_commerce_app/Features/Profile/Domain/Entity/Profile_user_Entity.dart';

abstract class ProfileState {}

class ProfileLoadingState extends ProfileState {}

class SingleUserDataLoadedState extends ProfileState {
  final ProfileUserEntity profileUserEntity;

  SingleUserDataLoadedState({required this.profileUserEntity});
}

class ProfileErrorState extends ProfileState {
  final String errorMessage;

  ProfileErrorState({required this.errorMessage});
}
