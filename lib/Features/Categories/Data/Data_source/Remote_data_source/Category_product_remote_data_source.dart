import 'package:e_commerce_app/Features/Categories/Data/Model/Category_product_Model.dart';

abstract class CategoryProductRemoteDataSource {
  Future<List<CategoryProductModel>> fetchCategoryProduct(String category);
}