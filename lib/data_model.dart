import 'package:meta/meta.dart';
import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    required this.isvalid,
    required this.message,
    required this.categorysReponse,
    required this.finalPrce,
    required this.discountAmount,
  });
  late final bool isvalid;
  late final String message;
  late final List<CategorysReponse> categorysReponse;
  late final int finalPrce;
  late final int discountAmount;

  Product.fromJson(Map<String, dynamic> json) {
    isvalid = json['isvalid'];
    message = json['message'];
    categorysReponse = List.from(json['categorysReponse'])
        .map((e) => CategorysReponse.fromJson(e))
        .toList();
    finalPrce = json['finalPrce'];
    discountAmount = json['discountAmount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isvalid'] = isvalid;
    _data['message'] = message;
    _data['categorysReponse'] =
        categorysReponse.map((e) => e.toJson()).toList();
    _data['finalPrce'] = finalPrce;
    _data['discountAmount'] = discountAmount;
    return _data;
  }
}

class CategorysReponse {
  CategorysReponse({
    required this.categoryId,
    required this.categoryName,
    this.categoryImage,
  });
  late final String categoryId;
  late final String categoryName;
  late final String? categoryImage;

  CategorysReponse.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    categoryImage = json['categoryImage'] ?? json[""];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['categoryId'] = categoryId;
    _data['categoryName'] = categoryName;
    _data['categoryImage'] = categoryImage;
    return _data;
  }
}
