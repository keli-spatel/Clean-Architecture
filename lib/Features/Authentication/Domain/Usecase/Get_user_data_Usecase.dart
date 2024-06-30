import 'package:dartz/dartz.dart';
import '../../../../Core/Error/Failure/Failure.dart';
import '../Repository/User_Repository.dart';

class GetUserDataUsecase {
  final UserRepository userRepository;

  GetUserDataUsecase({required this.userRepository});

  Future<Either<Failure, void>> call() => userRepository.getUserData();
}
