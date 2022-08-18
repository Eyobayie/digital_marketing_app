import 'dart:convert';

import 'package:flutter/foundation.dart';



class ShopList{
  List<Shop> shops=[];
  ShopList({required this.shops});

  factory ShopList.fromJson(List<dynamic> allShops){
    List<Shop> list=allShops.map((shop) => Shop.fromJson(shop)).toList();
    return ShopList(shops: list);
  }
}

class Shop{
    int id;
    String name;
    String zone;
    String woreda;
    String firstName;
    String lastName;
    int shopStatus;
    String city;
    Shop({
      required this.id,
      required this.name,
      required this.zone,
      required this.woreda,
      required this.firstName,
      required this.lastName,
      required this.shopStatus,
      required this.city,
       });
     factory Shop.fromJson(Map<String,dynamic>jsonData){
        return Shop(
          id: jsonData['id'], 
          name: jsonData['name'], 
          zone: jsonData['zone'], 
          woreda: jsonData['woreda'], 
          firstName: jsonData['first_name'],
          lastName: jsonData['lastName'], 
          shopStatus: jsonData['shop_status'], 
          city: jsonData['city']);
    }
}
