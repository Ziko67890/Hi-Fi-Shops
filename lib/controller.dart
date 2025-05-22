import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter666_tutorial/models/allproduct_model.dart';
import 'package:flutter666_tutorial/models/product_model.dart';
import 'package:http/http.dart' as http;

class Controller extends ChangeNotifier {
  AllProductModel?  allProductModel = null;
  Future<void> getAllProduct( BuildContext context) async {

    try{
      const url =
          'https://api.freeapi.app/api/v1/public/randomproducts?page=1&limit=10&inc=category%252Cprice%252Cthumbnail%252Ctitle%252Cid&query=laptops';
      // ?page=1&limit=4&inc=category%252Cprice%252Cthumbnail%252Cimages%252Ctitle%252Cid&query=mens-watches
      final http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        log(response.body.toString());
        allProductModel=   AllProductModel.fromJson(jsonDecode(response.body));
        notifyListeners();
      } else {
        print("Error");
        null;
      }

    } on SocketException catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No internet Connection")));}


catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));}

  }

  Future<AProductModel?> getAProduct(int id) async {
    final url = Uri.parse(
      'https://api.freeapi.app/api/v1/public/randomproducts/$id',
    );
    final http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body.toString());
      return AProductModel.fromJson(jsonDecode(response.body));
    } else {
      print('Error');
      null;
    }
  }
}
