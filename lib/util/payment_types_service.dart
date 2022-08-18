import 'dart:convert';

import 'package:rynsysengineering/models/payment_types.dart';

import 'package:http/http.dart' as http;

class PaymentTypeService{
  late PaymentTypeList paymentTypes;
  Future<PaymentTypeList> fetchPaymentTypes() async{
    final response= await http.get(Uri.parse('https://rensys-laravel.merahitechnologies.com/api/payment_types'));
     if(response.statusCode==200){
      paymentTypes=PaymentTypeList.fromJson(jsonDecode(response.body));
      return paymentTypes;
     }
     else{
      throw Exception('FAILED TO LOAD DATA');
     }
  }
}
