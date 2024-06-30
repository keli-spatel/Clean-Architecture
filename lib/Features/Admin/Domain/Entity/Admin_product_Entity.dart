import 'dart:io';

import 'package:equatable/equatable.dart';

class AdminProductEntity extends Equatable {
  final String productName;
  final String description;
  final List<File> image;
  final String price;
  final String quantity;
  final String category;

  const AdminProductEntity({
    required this.productName,
    required this.description,
    required this.image,
    required this.price,
    required this.quantity,
    required this.category,
  });

  @override
  List<Object?> get props => [
        productName,
        description,
        image,
        price,
        quantity,
        category,
      ];
}
