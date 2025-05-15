import 'dart:convert';
import 'dart:developer';

import 'package:flutter666_tutorial/product.dart';
import 'package:http/http.dart' as network;

class Controller {
  Future<Products?> getRandomproducts() async {
    final url = Uri.https(
      "https://api.freeapi.app",
      "/api/v1/public/randomproducts",
    );
    final network.Response response = await network.get(url);
    log("This is the response${response.body}");
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final items = data['data'];
      return items.map((item) => Products.fromJson(item)).toList();
    } else {
      return null;
    }
  }
}
