import 'dart:convert';

import 'package:frontendtestkriya2020/core/model/productModel.dart';
import 'package:http/http.dart' as http;

class ProductService {

  Future<List<ProductModel>> getProduct() async{

    final url = "https://jsonplaceholder.typicode.com/todos";

    try {

      var data = await http.get(Uri.parse(url));

      List<ProductModel> products = [];

      final response = jsonDecode(data.body);

      products = List<ProductModel>.from(response.map((data) => ProductModel.fromJson(data)));

      return products;

    }catch(e) {

      print("error $e");

      throw e;
    }

  }

}