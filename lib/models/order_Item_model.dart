import 'cart_item_model.dart';

class OrderItem{
  String id;
  int shopId;
  List<CartItem> items;
  DateTime pickupDate;
  int userId;
  int addressId;
  OrderItem({
    required this.id,
    required this.shopId,
    required this.pickupDate,
     required this.items,
     required this.userId,
     required this.addressId
  });
}