import 'cart_item_model.dart';

class OrderItem{
  String id;
  double totalCost;
  List<CartItem> items;
  DateTime date;

  OrderItem({
    required this.id,
    required this.totalCost,
     required this.items,
     required this.date
  });
}