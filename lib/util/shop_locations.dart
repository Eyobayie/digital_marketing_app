import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rynsysengineering/models/shops.dart';

class Shop {
  int id;
  String kebele;
  String shopName;
  String region;
  String zone;
  String woreda;
  String city;
  String lng;
  String phoneNo;
  String lat;

  Shop(
      {required this.id,
      required this.kebele,
      required this.shopName,
      required this.city,
      required this.woreda,
      required this.zone,
      required this.region,
      required this.phoneNo,
      required this.lng,
      required this.lat});

  factory Shop.fromJson(Map<String, dynamic> json) {
    String phoneNo = "";
    if (json['phone_numbers'] != null) {
      phoneNo = json['phone_numbers'][0]['phone_number'];
    }

    return Shop(
        id: json['id'],
        kebele: json['kebele'],
        shopName: json['shop_name'],
        city: json['city'],
        woreda: json['woreda'],
        zone: json['zone'],
        region: json['region'],
        phoneNo: json['phone_no']??'',
        lng: json['longitude'],
        lat: json['latitude']);
  }
}

class ShopController {
  Future<List<Shop>> fetchShops() async {
    final response = await http.get(Uri.parse(
        'https://rensys-laravel.merahitechnologies.com/api/user_shops'));
    if (response.statusCode == 200) {
      print('🤣 coordinate');
      print(response.body);
      var resData = jsonDecode(response.body);
      List<Shop> shopList = [];
      List shopResponse = resData['data'] as List;
      for (int i = 0; i < shopResponse.length; i++) {
        Map<String, dynamic> map = shopResponse[i];
        shopList.add(Shop.fromJson(map));
      }
      return shopList;
    } else {
      throw Exception('Failed to load');
    }
  }
}
// Future<List<RoleModel>> fetchRoleModels(userId) async {
//     List<RoleModel> roleModels = [];
//     final response = await apiBaseHelper.get(url: '/user/get_role_models?isLegal$userId');
   
//     }
//     return roleModels;
 