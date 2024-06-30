import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/Authentication/Domain/Repository/User_Repository.dart';

import '../../../../Core/Error/Failure/Failure.dart';

class IsLoggedInUserUsecase {
  final UserRepository userRepository;

  IsLoggedInUserUsecase({
    required this.userRepository,
  });

  Future<Either<Failure, bool>> call() => userRepository.isLoggedInUser();
}
