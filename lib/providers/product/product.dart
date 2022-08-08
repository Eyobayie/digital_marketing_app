 class ProductList {
   List<Product> products=[];
   ProductList({required this.products});

   factory ProductList.fromJson(List<dynamic> parsedJson){
      List<Product> productList = parsedJson.map((product)=>Product.fromJson(product)).toList();
    return ProductList(
       products: productList,
    );
   }
 }
class Product {
  int id;
  String name;
  String model;
  String brand;
  String price;
  String quantity;//qty
  int possibleQuantity;//possible_qty
  String isFeatured;//is_featured
  String isActive;//is_active
  String weight;
  // double? maximum_supply_voltage;
  // double? maximum_current_voltage;
  // String ? description;
  // String ? detail;
  Photo images;
  Category category;
  Product({
    required this.id,
    required this.name,
    required this.model,
    required this.brand,
    required this.price,
    required this.quantity,
    required this.possibleQuantity,
    required this.isFeatured,
    required this.isActive,
    required this.weight, 
    required this.images,
    required this.category,
  });
  
  factory Product.fromJson(Map<String,dynamic> jsonData){
    return Product(
      id: jsonData['id'],
      name:jsonData['name'],
      model: jsonData['model'], 
      brand: jsonData['brand'], 
      price: jsonData['price'], 
      quantity: jsonData['qty'], 
      possibleQuantity: jsonData['possible_qty'], 
      isFeatured: jsonData['is_featured'], 
      isActive: jsonData['is_active'], 
      weight: jsonData['weight'], 
      images: Photo.fromJson(jsonData['images']), 
      category: Category.fromJson(jsonData['category']));
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
// class PhotoList{
//   List<Photo>? imageList=[];
//      PhotoList({this.imageList});
//    factory PhotoList.fromJson(List<dynamic> parsedJson){
//       List<Photo> imageLlist = parsedJson.map((photo)=>Photo.fromJson(photo)).toList();
//     return PhotoList( 
//       imageList: imageLlist
//       );
//    }
// }

class Category{
    int id;
    String title;

    Category({
      required this.id,
      required this.title
      });

     factory Category.fromJson(Map<String,dynamic> jsonData){
        return Category(
          id: jsonData['id'],
          title: jsonData['title']
          );
      }

     Map<String,dynamic> toJson(){
    return{
    'id':id,
    'title':title,
    };
   }
  }
