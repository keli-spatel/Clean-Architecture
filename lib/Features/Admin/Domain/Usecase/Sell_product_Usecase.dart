import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Failure/Failure.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Entity/Admin_product_Entity.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Repository/Admin_product_repository.dart';

class SellProductUsecase {
  final AdminProductRepository adminProductRepository;

  SellProductUsecase({required this.adminProductRepository});

  Future<Either<Failure, void>> call(AdminProductEntity adminProductEntity) =>
      adminProductRepository.sellProduct(adminProductEntity);
}
