import 'dart:convert';

import 'package:rynsysengineering/models/shops.dart';
import 'package:http/http.dart' as http;

class ShopService{
  late ShopList shopList;
  Future<ShopList> fetchShops() async{
    final response= await http.get(Uri.parse('https://rensys-laravel.merahitechnologies.com/api/shops'));
        if(response.statusCode==200){
          shopList=ShopList.fromJson(jsonDecode(response.body)['data']);
          return shopList;
        }
        else{      
      throw Exception('Failed to load /////////////////// !!!');
      }
  }
}