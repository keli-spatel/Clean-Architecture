import 'dart:convert';

import 'package:e_commerce_app/Features/Search/Data/Model/Search_product_Model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../../Core/Error/Exception/Exception.dart';
import 'Search_product_Remote_data_source.dart';

class SearchProductRemoteDataSourceImpl
    implements SearchProductRemoteDataSource {
  @override
  Future<List<SearchProductModel>> getSearchProduct(String productName) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String? token = pref.getString("x-auth-token");

    final http.Response response = await http.get(
        Uri.parse(
          "http://192.168.85.146:3000/product/search/$productName",
        ),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": token!,
        });

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      final List<SearchProductModel> searchProduct = result
          .map((e) => SearchProductModel.fromMap(e as Map<String, dynamic>))
          .toList();
      print(searchProduct);
      return searchProduct;
    } else if (response.statusCode == 400) {
      print("${jsonDecode(response.body)['msg']}");
      throw ServerException400(
        message: "${jsonDecode(response.body)['msg']}",
        statusCode: 400,
      );
    } else if (response.statusCode == 401) {
      print("${jsonDecode(response.body)['msg']}");
      throw ServerException401(
        message: "${jsonDecode(response.body)['msg']}",
        statusCode: 401,
      );
    } else if (response.statusCode == 500) {
      print("${jsonDecode(response.body)['error']}");
      throw ServerException500(
        message: "${jsonDecode(response.body)['error']}",
        statusCode: 500,
      );
    } else {
      throw const UnHandleException(
        message: "UnExpected Error",
        statusCode: 000,
      );
    }
  }

  @override
  Future<List<SearchProductModel>> getSearchSuggestionProduct(String productSuggestedName) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String? token = pref.getString("x-auth-token");

    final http.Response response = await http.get(
        Uri.parse(
          "http://192.168.85.146:3000/all-product",
        ),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": token!,
        });

    if (response.statusCode == 200) {
      final List<dynamic> result = jsonDecode(response.body);
      final List<SearchProductModel> searchProduct = result
          .map((e) => SearchProductModel.fromMap(e as Map<String, dynamic>))
          .where((user) =>
              user.productName.toLowerCase().contains(productSuggestedName.toLowerCase()))
          .toList();
      print(searchProduct);
      return searchProduct;
    } else if (response.statusCode == 400) {
      print("${jsonDecode(response.body)['msg']}");
      throw ServerException400(
        message: "${jsonDecode(response.body)['msg']}",
        statusCode: 400,
      );
    } else if (response.statusCode == 401) {
      print("${jsonDecode(response.body)['msg']}");
      throw ServerException401(
        message: "${jsonDecode(response.body)['msg']}",
        statusCode: 401,
      );
    } else if (response.statusCode == 500) {
      print("${jsonDecode(response.body)['error']}");
      throw ServerException500(
        message: "${jsonDecode(response.body)['error']}",
        statusCode: 500,
      );
    } else {
      throw const UnHandleException(
        message: "UnExpected Error",
        statusCode: 000,
      );
    }
  }
}
