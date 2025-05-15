import 'dart:convert';
import 'dart:developer';

import 'package:flutter666_tutorial/models/allproduct_model.dart';
import 'package:http/http.dart' as http;

class Controller {
  Future<AllProductModel?> getAllProduct()async{
 const url=   'https://api.freeapi.app/api/v1/public/randomproducts?page=1&limit=10&inc=category%252Cprice%252Cthumbnail%252Ctitle%252Cid&query=laptops';
   // ?page=1&limit=4&inc=category%252Cprice%252Cthumbnail%252Cimages%252Ctitle%252Cid&query=mens-watches
    final http.Response response = await http.get( Uri.parse(url));

    if(response.statusCode ==200){
      log(response.body.toString());
    return  AllProductModel.fromJson(jsonDecode(response.body));
    }else
      {print("Error");
      null;
      }
  }
  Future<void> getAProduct(int id)async{
    final url = 'https://api.freeapi.app/api/v1/public/randomproducts/$id';

  }
}