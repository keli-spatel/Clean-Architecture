import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Entity/Admin_product_Entity.dart';

import '../../../../Core/Error/Failure/Failure.dart';

abstract class AdminProductRepository {
  //
  Future<Either<Failure, void>> sellProduct(
      AdminProductEntity adminProductEntity);
  //
  Future<Either<Failure, List<AdminProductEntity>>> getProductData(
      AdminProductEntity adminProductEntity);
}
