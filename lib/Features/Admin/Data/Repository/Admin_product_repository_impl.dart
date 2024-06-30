  import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Failure/Failure.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Entity/Admin_product_Entity.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Repository/Admin_product_repository.dart';

import '../../../../Core/Error/Exception/Exception.dart';
import '../Data_source/Remote_data_source/Admin_product_Remote_data_source.dart';
import '../Model/Admin_product_model.dart';

class AdminProductRepositoryImpl extends AdminProductRepository {
  final AdminProductRemoteDataSource adminProductRemoteDataSource;

  AdminProductRepositoryImpl({required this.adminProductRemoteDataSource});

  @override
  Future<Either<Failure, void>> sellProduct(
      AdminProductEntity adminProductEntity) async {
    try {
      await adminProductRemoteDataSource.sellProduct(adminProductEntity);
      return const Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    } on ServerException400 catch (e) {
      return Left(ApiFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    } on ServerException401 catch (e) {
      return Left(ApiFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    } on ServerException500 catch (e) {
      return Left(ApiFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, List<AdminProductEntity>>> getProductData(
      AdminProductEntity adminProductEntity) async {
    try {
      final List<AdminProductModel> productData =
          await adminProductRemoteDataSource.getProductData(adminProductEntity);
      return Right(productData);
    } on ServerException500 catch (e) {
      return Left(
        ApiFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    } on UnHandleException catch (e) {
      return Left(
        ApiFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    }
  }
}
