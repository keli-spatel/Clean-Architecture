import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/Authentication/Data/Data_source/Remote_data_source/User_remote_data_source.dart';
import 'package:e_commerce_app/Features/Authentication/Domain/Entity/User_Entity.dart';
import 'package:e_commerce_app/Features/Authentication/Domain/Repository/User_Repository.dart';
import '../../../../Core/Error/Exception/Exception.dart';
import '../../../../Core/Error/Failure/Failure.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, void>> signInUser(UserEntity userEntity) async {
    try {
      await userRemoteDataSource.signInUser(userEntity);
      return const Right(null);
    } on ServerException400 catch (e) {
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
    }
  }

  @override
  Future<Either<Failure, void>> signUpUser(UserEntity userEntity) async {
    try {
      await userRemoteDataSource.signUpUser(userEntity);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(
        ApiFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    } on ServerException400 catch (e) {
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
    }
  }

  @override
  Future<Either<Failure, void>> getUserData() async {
    try {
      await userRemoteDataSource.getUserData();
      return const Right(null);
    } on ApiException catch (e) {
      return Left(
        ApiFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> isLoggedInUser() async {
    try {
      final isLogin = await userRemoteDataSource.isLoggedInUser();
      return Right(isLogin);
    } on ApiException catch (e) {
      return Left(
        ApiFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
