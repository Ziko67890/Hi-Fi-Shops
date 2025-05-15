class AllProductModel{
  int? statusCode;
  Map<String, dynamic>? data;
  bool? success;
  String? message;
  AllProductModel({this.message, this.data,this.success, this.statusCode});


  factory AllProductModel.fromJson(Map<String, dynamic> json){

    return AllProductModel(
      statusCode:json["statusCode"],
        data:  json["data"],
      success:json["success"],
      message:json["message"]
    );
  }
}