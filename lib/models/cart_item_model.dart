import 'package:rynsysengineering/providers/product/productdetailprovider.dart';

class CartItem{
  String cartId;
  String name;
  String price;
  String imgUrl;
  String quantity;
  CartItem({
           required this.cartId,
           required this.name,
           required this.price,
           required this.quantity,
           required this.imgUrl,
  });
}