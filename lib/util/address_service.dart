import 'package:rynsysengineering/models/address.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class DeliveryAddressService{
  late DeliveryAddress address;
  Future<DeliveryAddress> fetchAddress() async{
    final response= await http.get(Uri.parse('https://rensys-laravel.merahitechnologies.com/api/user_order_address/86'));
     if(response.statusCode==200){
     address=DeliveryAddress.fromJson(jsonDecode(response.body));
      return address;
     }
     else{
      throw Exception('FAILED TO LOAD DATA');
     }
  }
}