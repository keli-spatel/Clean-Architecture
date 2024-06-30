import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/Categories/Domain/Entity/Category_product_Entity.dart';

import '../../../../Core/Error/Failure/Failure.dart';

abstract class CategoryProductRepository {
  Future<Either<Failure, List<CategoryProductEntity>>> fetchCategoryProduct(String category);
}
