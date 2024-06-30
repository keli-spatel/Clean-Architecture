import 'package:e_commerce_app/Features/Search/Data/Model/Search_product_Model.dart';

abstract class SearchProductRemoteDataSource {
  Future<List<SearchProductModel>> getSearchProduct(String productName);
  Future<List<SearchProductModel>> getSearchSuggestionProduct(
      String productSuggestedName);
}
