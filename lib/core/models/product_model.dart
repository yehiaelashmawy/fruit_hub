import 'package:fruit_hub/core/helper/get_avg_rating.dart';
import 'package:fruit_hub/core/models/review_model.dart';
import '../entites/product_entity.dart';

class ProductModel {
  final String productName;
  final String productCode;
  final int productPrice;
  final String productDescription;
  final bool isFeatured;

  String? imageUrl;
  final int expiredMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount = 0;
  final int unitAmount;
  final num sellingCount;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.avgRating,
    required this.productName,
    required this.productCode,
    required this.productPrice,
    required this.productDescription,
    required this.reviews,
    required this.isFeatured,
    required this.isOrganic,
    required this.sellingCount,
    required this.expiredMonth,
    required this.numberOfCalories,
    required this.unitAmount,
    this.imageUrl,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final reviewsList = json['reviews'] != null
        ? (json['reviews'] as List).map((e) => ReviewModel.fromJson(e)).toList()
        : <ReviewModel>[];

    return ProductModel(
      avgRating: getAvgRating(reviewsList.map((e) => e.toEntity()).toList()),
      productName: json['productName'],
      productCode: json['productCode'],
      productPrice: json['productPrice'],
      productDescription: json['productDescription'],
      imageUrl: json['imageUrl'],
      isFeatured: json['isFeatured'],
      expiredMonth: json['expiredMonth'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      isOrganic: json['isOrganic'],
      sellingCount: json['sellingCount'],
      reviews: json['reviews'] != null
          ? (json['reviews'] as List)
                .map((e) => ReviewModel.fromJson(e))
                .toList()
          : <ReviewModel>[],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      productName: productName,
      productCode: productCode,
      productPrice: productPrice,
      productDescription: productDescription,
      imageUrl: imageUrl,
      isFeatured: isFeatured,
      expiredMonth: expiredMonth,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      isOrganic: isOrganic,
      sellingCount: sellingCount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toMap() {
    return {
      'productName': productName,
      'productCode': productCode,
      'productPrice': productPrice,
      'productDescription': productDescription,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expiredMonth': expiredMonth,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}
