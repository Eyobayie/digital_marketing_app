import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rynsysengineering/widgets/product/common.dart';

class ProductDetailScreen extends StatelessWidget {
   const ProductDetailScreen({ Key? key }) : super(key: key);
   static const productDetailRoute='productDetailRoute';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios),color: Colors.black,),
        backgroundColor: Colors.white,
        automaticallyImplyLeading:false,
        elevation: 0,
        shadowColor: Colors.white,
        title: const Text('Back',style: TextStyle(
          color: Colors.black,
          ),),
        toolbarHeight: 50,
         ),
    body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      children:[
      Common(),
      ]),
    );
  }
}