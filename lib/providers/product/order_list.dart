import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../models/cart_item_model.dart';
import '../../models/order_Item_model.dart';

class Orders with ChangeNotifier{
  List<OrderItem> _orders=[];

  List<OrderItem> get orders{
    return [..._orders];
  }
  
  // void addOrderItem(List<CartItem> cartItem, double totalPrice){
  //   _orders.insert(0, OrderItem(id:DateTime.now().toString(),
  //                date: DateTime.now(),
  //               items: cartItem,
  //                totalCost: totalPrice
  //             ));
  //   notifyListeners();
  // }
 Future<http.Response> orderPost(int shopId, DateTime pickupDate, items, int userId,int? addressId,int paymentMethodId,String? token )async{
  final response= await http.post(
    Uri.parse('https://rensys-laravel.merahitechnologies.com/api/pay'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json',
      'Authentication':'Bearer $token',
    },
    body: jsonEncode(<String, dynamic>{
      'shop_id': shopId,
      'pickup_date' : pickupDate.toString(),
      'products': items,
      'user_id' :userId,
      'address_id':addressId, 
      'payment_method':paymentMethodId,
    }),
  );
  if(response.statusCode==200){
    print('///////////////////////ffffffff');
    String url=response.body;
    print(url);
    _launchInWebViewOrVC((url));
    print('///////////////////////////kkkkkk');
  }
  else{
    print('there is post order error///////////////////');
  }
  return response;
  }
  Future<void> _launchInWebViewOrVC(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'eyob': 'payment'}),
    )) {
      throw 'Could not launch $url';
    }
  }

}