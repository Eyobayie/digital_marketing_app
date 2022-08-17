import 'package:rynsysengineering/providers/product/productdetailprovider.dart';

class CartItem{
  String cartId;
  int productId;
  String name;
  int price;
  String imgUrl;
  int quantity;
  CartItem({
           required this.cartId,
           required this.productId,
           required this.name,
           required this.price,
           required this.quantity,
           required this.imgUrl,
  });
}