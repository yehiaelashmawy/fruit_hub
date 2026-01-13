import 'dart:io';

import 'package:fruit_hub/core/entites/product_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    productName: 'Apple',
    productCode: 'APPL',
    productPrice: 10,
    productDescription: 'A red apple',
    imageUrl: 'https://example.com/apple.jpg',
    isFeatured: true,
    expiredMonth: 3,
    numberOfCalories: 100,
    unitAmount: 1,
    isOrganic: true, // Add this line
    sellingCount: 5,
    reviews: [], // Add this line
    productImage: File(''), // Add this line
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}
