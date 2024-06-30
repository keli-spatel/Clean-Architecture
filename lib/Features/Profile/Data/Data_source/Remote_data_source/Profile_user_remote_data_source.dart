import '../../Model/Profile_user_Model.dart';

abstract class ProfileUserRemoteDataSource {
  Future<ProfileUserModel> getSingleUserData();
}
