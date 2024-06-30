import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Error/Failure/Failure.dart';
import 'package:e_commerce_app/Features/Search/Data/Data_source/Remote_data_source/Search_product_Remote_data_source.dart';
import 'package:e_commerce_app/Features/Search/Domain/Entity/Search_product_Entity.dart';
import 'package:e_commerce_app/Features/Search/Domain/Repository/Search_product_Repository.dart';
import '../../../../Core/Error/Exception/Exception.dart';

class SearchProductRepositoryImpl implements SearchProductRepository {
  final SearchProductRemoteDataSource searchProductRemoteDataSource;

  SearchProductRepositoryImpl({required this.searchProductRemoteDataSource});
  @override
  Future<Either<Failure, List<SearchProductEntity>>> getSearchProduct(
    String productName,
  ) async {
    try {
      final result =
          await searchProductRemoteDataSource.getSearchProduct(productName);
      return Right(result);
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
    } on UnHandleException catch (e) {
      return Left(ApiFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    }
  }

  @override
  Future<Either<Failure, List<SearchProductEntity>>> getSearchSuggestionProduct(
      String productSuggestedName) async {
    try {
      final result = await searchProductRemoteDataSource
          .getSearchSuggestionProduct(productSuggestedName);
      return Right(result);
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
    } on UnHandleException catch (e) {
      return Left(ApiFailure(
        message: e.message,
        statusCode: e.statusCode,
      ));
    }
  }
}
