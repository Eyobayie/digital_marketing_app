import 'package:flutter/cupertino.dart';

import '../../models/cart_item_model.dart';
import 'productdetailprovider.dart';

class Cart with ChangeNotifier {
  Map<int, CartItem> _cartItems = {};

  Map<int, CartItem> get cartItems {
    return {..._cartItems};
  }

  int get getItemCount {
    int total = 0;
    _cartItems.forEach((productId, cartItem) {
      total += cartItem.quantity;
    });
    return total;
  }

  void removeCartItem(int productId) {
    _cartItems.remove(productId);
    print(_cartItems.length);
    notifyListeners();
  }

  double get getTotalPrice {
    double total = 0;
    _cartItems.forEach((productId, cartItem) {
      total += cartItem.price *cartItem.quantity;
    });
    return total;
  }

  void addItem(int productId, String name, int price, String image,
      {qty = 1}) {
    if (_cartItems.containsKey(productId)) {
      _cartItems.update(
          productId,
          (existingItem) => CartItem(
              cartId: existingItem.cartId,
              productId: existingItem.productId,
              name: existingItem.name,
              imgUrl: existingItem.imgUrl,
              price: existingItem.price,
              quantity: qty));
    } else {
      _cartItems.putIfAbsent(
          productId,
          () => CartItem(
              cartId: DateTime.now().toString(),
              productId: productId,
              name: name,
              price: price,
              quantity: qty,
              imgUrl: image));
           }
    notifyListeners();
      }
  void removeAll() {
    _cartItems.clear();
    notifyListeners();
  }
}
