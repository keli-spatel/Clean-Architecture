import '../../../Domain/Entity/Search_product_Entity.dart';

class SearchSuggestionProductState {}

class SearchSuggestionProductLoadingState
    extends SearchSuggestionProductState {}

class SearchSuggestionProductLoadedState extends SearchSuggestionProductState {
  final List<SearchProductEntity> searchProduct;

  SearchSuggestionProductLoadedState({required this.searchProduct});
}

class SearchSuggestionProductErrorState extends SearchSuggestionProductState {
  final String errorMessage;

  SearchSuggestionProductErrorState({required this.errorMessage});
}
