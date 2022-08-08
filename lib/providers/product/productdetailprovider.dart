


//  class ProductList {
//    List<productDetail> products=[];
//    ProductList({required this.products});

//    factory ProductList.fromJson(List<dynamic> parsedJson){
//       List<productDetail> productList = parsedJson.map((product)=>productDetail.fromJson(product)).toList();
//     return ProductList(
//        products: productList,
//     );
//    }
//  }
import 'package:flutter/cupertino.dart';

class ProductDetail with ChangeNotifier{
  int id;
  String name;
  String model;
  String brand;
  String price;
  String quantity;//qty
  String isFeatured;//is_featured
  String isActive;//is_active
  String weight;
  String? maximumSupplyVoltage;
  String? maximumCurrentVoltage;
  String description;
  String detail;
  PhotoList allPhotos;
  String categoryId;
  ProductDetail({
    required this.id,
    required this.name,
    required this.model,
    required this.brand,
    required this.price,
    required this.quantity,
    required this.isFeatured,
    required this.isActive,
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
      isActive: jsonData['is_active'], 
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

// class Category{
//     int id;
//     String title;

//     Category({
//       required this.id,
//       required this.title
//       });

//      factory Category.fromJson(Map<String,dynamic> jsonData){
//         return Category(
//           id: jsonData['id'],
//           title: jsonData['title']
//           );
//       }

//      Map<String,dynamic> toJson(){
//     return{
//     'id':id,
//     'title':title,
//     };
//    }
//   }


