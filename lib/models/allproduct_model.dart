import 'dart:convert';

class AllProductModel {
  final int? statusCode;
  final Data? data;
  final String? message;
  final bool? success;

  AllProductModel({this.statusCode, this.data, this.message, this.success});

  factory AllProductModel.fromRawJson(String str) =>
      AllProductModel.fromJson(json.decode(str));

  factory AllProductModel.fromJson(Map<String, dynamic> json) =>
      AllProductModel(
        statusCode: json["statusCode"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        success: json["success"],
      );
}

class Data {
  final int? page;
  final int? limit;
  final int? totalPages;
  final bool? previousPage;
  final bool? nextPage;
  final int? totalItems;
  final int? currentPageItems;
  final List<ProductModel>? data;

  Data({
    this.page,
    this.limit,
    this.totalPages,
    this.previousPage,
    this.nextPage,
    this.totalItems,
    this.currentPageItems,
    this.data,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    page: json["page"],
    limit: json["limit"],
    totalPages: json["totalPages"],
    previousPage: json["previousPage"],
    nextPage: json["nextPage"],
    totalItems: json["totalItems"],
    currentPageItems: json["currentPageItems"],
    data:
        json["data"] == null
            ? []
            : List<ProductModel>.from(
              json["data"]!.map((x) => ProductModel.fromJson(x)),
            ),
  );
}

class ProductModel {
  final int? id;
  final String? title;
  final String? description;
  final int? price;
  final double? discountPercentage;
  final double? rating;
  final int? stock;
  final String? brand;
  final String? category;
  final String? thumbnail;
  final List<String>? images;

  ProductModel({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  factory ProductModel.fromRawJson(String str) =>
      ProductModel.fromJson(json.decode(str));

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"],
    discountPercentage: json["discountPercentage"]?.toDouble(),
    rating: json["rating"]?.toDouble(),
    stock: json["stock"],
    brand: json["brand"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    images:
        json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
  );
}
