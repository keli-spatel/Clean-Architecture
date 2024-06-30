import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Failure/Failure.dart';
import 'package:e_commerce_app/Features/Profile/Domain/Entity/Profile_user_Entity.dart';
import 'package:e_commerce_app/Features/Profile/Domain/Repository/Profile_user_Repository.dart';

class GetSingleUserDataUsecase {
  final ProfileUserRepository profileUserRepository;

  GetSingleUserDataUsecase({required this.profileUserRepository});

  Future<Either<Failure, ProfileUserEntity>> call(
          ProfileUserEntity profileUserEntity) =>
      profileUserRepository.getSingleUserData();
}
