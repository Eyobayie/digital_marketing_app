 import 'dart:convert';
 import 'package:http/http.dart'as http;
// import 'package:rynsysengineering/providers/product/product.dart';
import 'package:rynsysengineering/providers/product/category_products.dart';

class CategoryProductService {
  late final CatProductList products;
  Future<CatProductList> fetchCategoryProducts(int id) async {
    final response = await http
        .get(Uri.parse('https://rensys-laravel.merahitechnologies.com/api/get_products/$id'));
    if (response.statusCode == 200) {
         products=CatProductList.fromJson(jsonDecode(response.body)['data']);
         return products;
     } else {
      throw Exception('Failed to load /////////////////// !!!');
    }
  }
}