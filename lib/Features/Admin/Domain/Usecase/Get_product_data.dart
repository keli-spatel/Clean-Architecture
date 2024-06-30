import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Failure/Failure.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Entity/Admin_product_Entity.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Repository/Admin_product_repository.dart';

class GetProductDataUsecase {
  final AdminProductRepository adminProductRepository;

  GetProductDataUsecase({required this.adminProductRepository});

  Future<Either<Failure, List<AdminProductEntity>>> call(
    AdminProductEntity adminProductEntity,
  ) =>
      adminProductRepository.getProductData(adminProductEntity);
}
