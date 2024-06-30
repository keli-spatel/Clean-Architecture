import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Failure/Failure.dart';

import '../Entity/Search_product_Entity.dart';
import '../Repository/Search_product_Repository.dart';

class GetSearchProductUsecase {
  final SearchProductRepository searchProductRepository;

  GetSearchProductUsecase({required this.searchProductRepository});

  Future<Either<Failure, List<SearchProductEntity>>> call(String productName) =>
      searchProductRepository.getSearchProduct(productName);
}
