import '../../../Domain/Entity/Search_product_Entity.dart';

abstract class SearchProductState {}

class SearchProductLoadingState extends SearchProductState {}

class SearchProductLoadedState extends SearchProductState {
  final List<SearchProductEntity> searchProduct;

  SearchProductLoadedState({required this.searchProduct});
}

class SearchProductErrorState extends SearchProductState {
  final String errorMessage;

  SearchProductErrorState({required this.errorMessage});
}
