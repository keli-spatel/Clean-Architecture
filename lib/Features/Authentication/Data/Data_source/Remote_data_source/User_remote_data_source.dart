import '../../../Domain/Entity/User_Entity.dart';

abstract class UserRemoteDataSource {
  Future<void> signInUser(UserEntity userEntity);
  Future<void> signUpUser(UserEntity userEntity);
  Future<void> getUserData();
  Future<bool> isLoggedInUser();
}
