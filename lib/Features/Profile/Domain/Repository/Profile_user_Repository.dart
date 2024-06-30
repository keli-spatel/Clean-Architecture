import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Failure/Failure.dart';
import 'package:e_commerce_app/Features/Profile/Domain/Entity/Profile_user_Entity.dart';

abstract class ProfileUserRepository {
  Future<Either<Failure, ProfileUserEntity>> getSingleUserData();
}
