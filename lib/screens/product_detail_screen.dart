import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rynsysengineering/widgets/product/common.dart';

class ProductDetailScreen extends StatelessWidget {
   const ProductDetailScreen({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
      padding: const EdgeInsets.symmetric(horizontal: 15),
      children: [
      Common(),
    ],),
    );
  }
}