class CategoryProductEvent {}

class GetCategoryProductEvent extends CategoryProductEvent {
  final String categoryProductName;

  GetCategoryProductEvent({required this.categoryProductName});
}
