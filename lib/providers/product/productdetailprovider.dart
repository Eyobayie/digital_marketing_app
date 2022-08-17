
import 'package:flutter/cupertino.dart';

class ProductDetail{
  int id;
  String name;
  String model;
  String brand;
  int price;
  int  quantity;//qty
  int isFeatured;//is_featured
  // int isActive;//is_active
  int weight;
  String? maximumSupplyVoltage;
  String? maximumCurrentVoltage;
  String description;
  String detail;
  PhotoList allPhotos;
  int categoryId;
  ProductDetail({
    required this.id,
    required this.name,
    required this.model,
    required this.brand,
    required this.price,
    required this.quantity,
    required this.isFeatured,
    //required this.isActive,
    required this.weight, 
             this.maximumSupplyVoltage,
             this.maximumCurrentVoltage,
    required this.description,
    required this.detail,
    required this.allPhotos,
    required this.categoryId,
  });
  
  factory ProductDetail.fromJson(Map<String,dynamic> jsonData){
    return ProductDetail(
      id: jsonData['id'],
      name:jsonData['name'],
      model: jsonData['model'], 
      brand: jsonData['brand'], 
      price: jsonData['price'], 
      quantity: jsonData['qty'], 
      isFeatured: jsonData['is_featured'], 
      //isActive: jsonData['is_active'], 
      weight: jsonData['weight'], 
      maximumSupplyVoltage: jsonData['maximum_supply_voltage'],
      maximumCurrentVoltage: jsonData['maximum_current_power'],
      description: jsonData['description'],
      detail: jsonData['detail'],
      allPhotos: PhotoList.fromJson(jsonData['images']),
      categoryId: jsonData['category_id']);
  }
}

class Photo {
  int id;
  String path;
  Photo({
    required this.id,
    required this.path
    });

  factory Photo.fromJson(Map<String, dynamic> jsonData){
    return Photo(
      id: jsonData['id'],
      path: jsonData['path']
    );
  }

  Map<String,dynamic> toJson(){
    return{
    'id':id,
    'path':path,
    };
  }
}
// Product photo list
class PhotoList{
  List<Photo>? imageList=[];
     PhotoList({this.imageList});
   factory PhotoList.fromJson(List<dynamic> parsedJson){
      List<Photo> imageLlist = parsedJson.map((photo)=>Photo.fromJson(photo)).toList();
    return PhotoList( 
      imageList: imageLlist
      );
   }
}




