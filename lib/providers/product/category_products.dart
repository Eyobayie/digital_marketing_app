 class CatProductList {
   List<CategoryProduct> categoryproducts=[];
   CatProductList({required this.categoryproducts});

   factory CatProductList.fromJson(List<dynamic> parsedJson){
      List<CategoryProduct> productList = parsedJson.map((product)=>CategoryProduct.fromJson(product)).toList();
    return CatProductList(
       categoryproducts: productList,
    );
   }
 }
class CategoryProduct{
  int id;
  String name;
  int price;
  String description;
  Photo? photo;

  CategoryProduct({
    required this.id,
    required this.name, 
    required this.price, 
    required this.description, 
    required this.photo });
  factory CategoryProduct.fromJson(Map<String, dynamic> jsonData){
    return CategoryProduct(
    id: jsonData['id'], 
    name: jsonData['name'], 
    price: jsonData['price'], 
    description: jsonData['description'], 
    photo:Photo.fromJson(jsonData['images']));
  }
}

class Photo {
  int id;
  String path;
  Photo({
    required this.id, 
    required this.path});
  factory Photo.fromJson(Map<String, dynamic> jsonData){
    return Photo(
      id: jsonData['id'], 
      path: jsonData['path']);
  }  
}