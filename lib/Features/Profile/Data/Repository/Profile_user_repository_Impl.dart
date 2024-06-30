import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Failure/Failure.dart';
import 'package:e_commerce_app/Features/Profile/Data/Model/Profile_user_Model.dart';
import 'package:e_commerce_app/Features/Profile/Domain/Entity/Profile_user_Entity.dart';
import 'package:e_commerce_app/Features/Profile/Domain/Repository/Profile_user_Repository.dart';
import '../../../../Core/Error/Exception/Exception.dart';
import '../Data_source/Remote_data_source/Profile_user_remote_data_source.dart';

class ProfileUserRepositoryImpl implements ProfileUserRepository {
  final ProfileUserRemoteDataSource profileUserRemoteDataSource;

  ProfileUserRepositoryImpl({
    required this.profileUserRemoteDataSource,
  });

  @override
  Future<Either<Failure, ProfileUserModel>> getSingleUserData() async {
    try {
      final ans = await profileUserRemoteDataSource.getSingleUserData();
      return Right(ans);
    } on ServerException400 catch (e) {
      return Left(
        ApiFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    } on ServerException401 catch (e) {
      return Left(
        ApiFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    } on ServerException500 catch (e) {
      return Left(
        ApiFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    } on UnHandleException catch (e) {
      return Left(
        ApiFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
