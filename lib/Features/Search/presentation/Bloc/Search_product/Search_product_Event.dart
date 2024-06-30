abstract class SearchProductEvent {}

class GetSearchProductEvent extends SearchProductEvent {
  final String productName;

  GetSearchProductEvent({required this.productName});
}