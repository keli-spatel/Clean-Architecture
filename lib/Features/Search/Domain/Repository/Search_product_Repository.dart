import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Failure/Failure.dart';
import 'package:e_commerce_app/Features/Search/Domain/Entity/Search_product_Entity.dart';

abstract class SearchProductRepository {
  Future<Either<Failure, List<SearchProductEntity>>> getSearchProduct(
    String productName,
  );
  Future<Either<Failure, List<SearchProductEntity>>>
      getSearchSuggestionProduct(String productSuggestedName);
}
