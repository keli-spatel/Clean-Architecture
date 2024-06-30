import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Failure/Failure.dart';
import 'package:e_commerce_app/Features/Categories/Domain/Entity/Category_product_Entity.dart';

import '../Repository/Category_product_Repository.dart';

class FetchCategoryProductUsecase {
  final CategoryProductRepository categoryProductRepository;

  FetchCategoryProductUsecase({required this.categoryProductRepository});

  Future<Either<Failure, List<CategoryProductEntity>>> call(String category) =>
      categoryProductRepository.fetchCategoryProduct(category);
}
