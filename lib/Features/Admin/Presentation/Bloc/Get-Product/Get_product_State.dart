import 'package:e_commerce_app/Features/Admin/Domain/Entity/Admin_product_Entity.dart';

abstract class GetProductState {}

class GetProductLoadingState extends GetProductState {}

class GetProductLoadedState extends GetProductState {
  final List<AdminProductEntity> productList;

  GetProductLoadedState({required this.productList});
}

class GetProductErrorState extends GetProductState {
  final String errorMessage;

  GetProductErrorState({required this.errorMessage});
}
