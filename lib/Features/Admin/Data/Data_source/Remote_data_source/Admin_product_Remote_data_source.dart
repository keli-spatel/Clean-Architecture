import 'package:e_commerce_app/Features/Admin/Data/Model/Admin_product_model.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Entity/Admin_product_Entity.dart';

abstract class AdminProductRemoteDataSource {
  Future<void> sellProduct(AdminProductEntity adminProductEntity);
  Future<List<AdminProductModel>> getProductData(AdminProductEntity adminProductEntity);
}
