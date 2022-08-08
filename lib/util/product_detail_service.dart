import 'package:rynsysengineering/providers/product/productdetailprovider.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

import '../widgets/product/detail.dart';
class ProductDetailService {
  Future<ProductDetail> fetchProductDetail(int productId) async {
    final response = await http
        .get(Uri.parse('https://rensys-laravel.merahitechnologies.com/api/products/$productId'));
    if (response.statusCode == 200) {
         //print(jsonDecode(response.body)['data'][1]['price']);
       return ProductDetail.fromJson(jsonDecode(response.body)['data']);
     } else {
      throw Exception('Failed to load users !!!');
    }
  }
}