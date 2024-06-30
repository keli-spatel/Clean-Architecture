import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Exception/Exception.dart';
import 'package:e_commerce_app/Core/Error/Failure/Failure.dart';
import 'package:e_commerce_app/Features/Categories/Domain/Entity/Category_product_Entity.dart';
import 'package:e_commerce_app/Features/Categories/Domain/Repository/Category_product_Repository.dart';

import '../Data_source/Remote_data_source/Category_product_remote_data_source.dart';

class CategoryProductRepositoryImpl implements CategoryProductRepository {
  final CategoryProductRemoteDataSource categoryProductRemoteDataSource;

  CategoryProductRepositoryImpl(
      {required this.categoryProductRemoteDataSource});
  @override
  Future<Either<Failure, List<CategoryProductEntity>>> fetchCategoryProduct(
    String category,
  ) async {
    try {
      final result =
          await categoryProductRemoteDataSource.fetchCategoryProduct(category);
      return Right(result);
    } on ServerException400 catch (e) {
      return Left(
        ApiFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    } on ServerException401 catch (e) {
      return Left(
        ApiFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
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
