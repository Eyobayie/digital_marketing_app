import 'package:flutter/cupertino.dart';

import '../../models/cart_item_model.dart';
import 'productdetailprovider.dart';

class Cart with ChangeNotifier{
  Map<String, CartItem> _cartItems={};

  Map<String, CartItem> get cartItems{
    return {..._cartItems};
  }
  int get getItemCount{
    int total=0;
    _cartItems.forEach((productId, cartItem) {
       total+=int.parse(cartItem.quantity) ;
    });
    return total;
}
 void removeCartItem(String productId){
    _cartItems.remove(productId);
    print(_cartItems.length);
    notifyListeners();
 }
 double get getTotalPrice{
    double total=0;
   _cartItems.forEach((productId, cartItem) {
     total+= double.parse(cartItem.price) * double.parse(cartItem.quantity) ;
   });
   return total;
 }
  void addItem(String productId,String name, String price , String image,{  qty=1}){
       if(_cartItems.containsKey(productId)){
         _cartItems.update(productId, (existingItem) =>
             CartItem(cartId: existingItem.cartId,
                     name: existingItem.name,
                     imgUrl: existingItem.imgUrl,
                     price: existingItem.price,
                     quantity: qty.toString())
                   );
                 }
       else{
         _cartItems.putIfAbsent(productId, () => CartItem(
             cartId: DateTime.now().toString(),
             name: name,
             price: price,
             quantity: qty.toString(),
             imgUrl: image));
          }
      notifyListeners();
    }
  void removeAll(){
    _cartItems.clear();
    notifyListeners();
    }
  }