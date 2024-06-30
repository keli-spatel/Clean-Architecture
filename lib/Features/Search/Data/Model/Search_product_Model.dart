import 'dart:io';
import '../../Domain/Entity/Search_product_Entity.dart';

class SearchProductModel extends SearchProductEntity {
  final String productName;
  final String description;
  final List<File> image;
  final String price;
  final String quantity;
  final String category;

  const SearchProductModel({
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
      "category": category
    };
  }

  factory SearchProductModel.fromMap(Map<String, dynamic> fMap) {
    return SearchProductModel(
      productName: fMap["productName"],
      description: fMap["description"],
      image: (fMap["image"] as List<dynamic>)
          .map((imageUrl) => File(imageUrl as String))
          .toList(),
      price: fMap["price"],
      quantity: fMap["quantity"],
      category: fMap["category"],
    );
  }
}
