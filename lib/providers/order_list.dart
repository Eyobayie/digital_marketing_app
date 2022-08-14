import 'package:flutter/cupertino.dart';

import '../models/cart_item_model.dart';
import '../models/order_Item_model.dart';

class Orders with ChangeNotifier{
  List<OrderItem> _orders=[];

  List<OrderItem> get orders{
    return [..._orders];
  }
  
  void addOrderItem(List<CartItem> cartItem, double totalPrice){
    _orders.insert(0, OrderItem(id:DateTime.now().toString(),
                 date: DateTime.now(),
                items: cartItem,
                 totalCost: totalPrice
              ));
    notifyListeners();
  }
}