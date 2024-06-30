import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/Authentication/Domain/Entity/User_Entity.dart';

import '../../../../Core/Error/Failure/Failure.dart';
import '../Repository/User_Repository.dart';

class SignInUserUsecase {
  final UserRepository userRepository;

  SignInUserUsecase({required this.userRepository});

  Future<Either<Failure,void>> call(UserEntity userEntity) =>
      userRepository.signInUser(userEntity);
}
