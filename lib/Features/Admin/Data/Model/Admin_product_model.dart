import 'dart:convert';
import 'dart:io';
import 'package:e_commerce_app/Features/Admin/Domain/Entity/Admin_product_Entity.dart';

class AdminProductModel extends AdminProductEntity {
  final String productName;
  final String description;
  final List<File> image;
  final String price;
  final String quantity;
  final String category;

  const AdminProductModel({
    required this.productName,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
    required this.category,
  }) : super(
          productName: productName,
          description: description,
          image: image,
          price: price,
          quantity: quantity,
          category: category,
        );

  Map<String, dynamic> toMap() {
    return {
      "productName": productName,
      "description": description,
      "image": image,
      "price": price,
      "quantity": quantity,
      "category": category,
    };
  }

  factory AdminProductModel.fromMap(Map<String, dynamic> fMap) {
    return AdminProductModel(
      productName: fMap["productName"] ?? "",
      description: fMap["description"] ?? "",
      image: (fMap['image'] as List<dynamic>)
          .map((imageUrl) => File(imageUrl as String))
          .toList(),
      price: fMap["price"] ?? "",
      quantity: fMap["quantity"] ?? "",
      category: fMap["category"] ?? "",
    );
  }

  String toJson() => jsonEncode(toMap());

  factory AdminProductModel.fromJson(String source) =>
      AdminProductModel.fromJson(jsonDecode(source));
}
