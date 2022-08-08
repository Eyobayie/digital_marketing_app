import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:rynsysengineering/providers/product/product.dart';

class ProductService {
  late final ProductList products;
  Future<ProductList> fetchProducts() async {
    final response = await http
        .get(Uri.parse('https://rensys-laravel.merahitechnologies.com/api/products'));
    if (response.statusCode == 200) {
         print(jsonDecode(response.body)['data'][1]['price']);
         products=ProductList.fromJson(jsonDecode(response.body)['data']);
         return products;
     } else {
      throw Exception('Failed to load /////////////////// !!!');
    }
  }
}