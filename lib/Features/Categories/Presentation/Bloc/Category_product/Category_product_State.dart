import '../../../Domain/Entity/Category_product_Entity.dart';

class CategoryProductState {}

class CategoryProductLoadingState extends CategoryProductState {}

class CategoryProductLoadedState extends CategoryProductState {
  final List<CategoryProductEntity> categoryProduct;

  CategoryProductLoadedState({required this.categoryProduct});
}

class CategoryProductErrorState extends CategoryProductState {
  final String errorMessage;

  CategoryProductErrorState({required this.errorMessage});
}
