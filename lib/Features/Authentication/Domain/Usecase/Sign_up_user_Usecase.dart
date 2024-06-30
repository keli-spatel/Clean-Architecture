import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/Authentication/Domain/Entity/User_Entity.dart';

import '../../../../Core/Error/Failure/Failure.dart';
import '../Repository/User_Repository.dart';

class SignUpUserUsecase {
  final UserRepository userRepository;

  SignUpUserUsecase({required this.userRepository});

  Future<Either<Failure,void>> call(UserEntity userEntity) =>
      userRepository.signUpUser(userEntity);
}
