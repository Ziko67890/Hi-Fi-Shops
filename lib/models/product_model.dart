import 'package:flutter666_tutorial/models/allproduct_model.dart';

class AProductModel {
  int? statusCode;
  ProductModel? data;
  bool? success;
  String? message;
  AProductModel({this.data, this.statusCode, this.message, this.success});

  factory AProductModel.fromJson(Map<String, dynamic> json) {
    return AProductModel(
      statusCode: json["statusCode"],
      data: json["data"] == null ? null : ProductModel.fromJson(json["data"]),
      success: json["success"],
      message: json["message"],
    );
  }
}
