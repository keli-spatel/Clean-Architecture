import 'package:dartz/dartz.dart';

import '../../../../Core/Error/Failure/Failure.dart';
import '../Entity/User_Entity.dart';

abstract class UserRepository {
  Future<Either<Failure,void>> signInUser(UserEntity userEntity);
  Future<Either<Failure,void>> signUpUser(UserEntity userEntity);
  Future<Either<Failure,void>> getUserData();
  Future<Either<Failure,bool>> isLoggedInUser();
}
