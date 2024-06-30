import 'dart:convert';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:e_commerce_app/Core/Error/Exception/Exception.dart';
import 'package:e_commerce_app/Features/Admin/Data/Data_source/Remote_data_source/Admin_product_Remote_data_source.dart';
import 'package:e_commerce_app/Features/Admin/Data/Model/Admin_product_model.dart';
import 'package:e_commerce_app/Features/Admin/Domain/Entity/Admin_product_Entity.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AdminProductRemoteDataSourceImpl implements AdminProductRemoteDataSource {
  @override
  Future<void> sellProduct(AdminProductEntity adminProductEntity) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String? token = pref.getString("x-auth-token");

    final cloudinary = CloudinaryPublic('dbbiltje3', 'r0psimwq');
    List<String> imageUrl = [];

    for (int i = 0; i < adminProductEntity.image.length; i++) {
      CloudinaryResponse cloudinaryResponse = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          adminProductEntity.image[i].path,
          folder: adminProductEntity.productName,
        ),
      );
      // print("object")
      imageUrl.add(cloudinaryResponse.secureUrl);
    }

    final http.Response productResponse = await http.post(
      Uri.parse("http://192.168.85.146:3000/admin/add-product"),
      headers: <String, String>{
        "Content-Type": "application/json; charset=UTF-8",
        "x-auth-token": token!,
      },
      body: jsonEncode({
        "productName": adminProductEntity.productName,
        "description": adminProductEntity.description,
        "image": imageUrl,
        "price": adminProductEntity.price,
        "quantity": adminProductEntity.quantity,
        "category": adminProductEntity.category,
      }),
    );

    if (productResponse.statusCode == 200) {
      print("Product Posted SuccessFully");
      print(productResponse.body);
    } else if (productResponse.statusCode == 401) {
      print("Invalid User : ${jsonDecode(productResponse.body)['msg']}");
      throw ServerException401(
        message: "${jsonDecode(productResponse.body)['msg']}",
        statusCode: 401,
      );
    } else if (productResponse.statusCode == 400) {
      print("Invalid User : ${jsonDecode(productResponse.body)['msg']}");
      throw ServerException400(
        message: "${jsonDecode(productResponse.body)['msg']}",
        statusCode: 400,
      );
    } else if (productResponse.statusCode == 500) {
      print("Invalid User : ${jsonDecode(productResponse.body)['error']}");
      throw ServerException500(
        message: "${jsonDecode(productResponse.body)['error']}",
        statusCode: 500,
      );
    }
  }

  @override
  Future<List<AdminProductModel>> getProductData(
      AdminProductEntity adminProductEntity) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    final String? token = pref.getString("x-auth-token");

    final http.Response getProductResponse = await http.get(
        Uri.parse(
          "http://192.168.85.146:3000/admin/get-product",
        ),
        headers: <String, String>{
          "Content-Type": "application/json; charset=UTF-8",
          "x-auth-token": token!,
        });

    if (getProductResponse.statusCode == 200) {
      final List<dynamic> result = jsonDecode(getProductResponse.body);
      List<AdminProductModel> productList = result
          .map((e) => AdminProductModel.fromMap(e as Map<String, dynamic>))
          .toList();
      print("$productList");
      return productList;
      // return result.map((e) => AdminProductModel.fromJson(e)).toList();
    } else if (getProductResponse.statusCode == 500) {
      print("${jsonDecode(getProductResponse.body)['error']}");
      throw ServerException500(
        message: "${jsonDecode(getProductResponse.body)['error']}",
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
