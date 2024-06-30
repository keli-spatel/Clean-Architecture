class SearchSuggestionProductEvent {}

class GetSearchSuggestionProductEvent extends SearchSuggestionProductEvent {
  final String productSuggestedName;

  GetSearchSuggestionProductEvent({required this.productSuggestedName});
}
