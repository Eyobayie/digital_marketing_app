import 'dart:io';

import 'package:flutter/material.dart';

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> imageList = [
      imageContainer('assets/images/shop1.jpg',context),
      imageContainer('assets/images/shop2.jpg',context),
      imageContainer('assets/images/shop3.jpg',context),
      imageContainer('assets/images/shop4.jpg',context),
    ];
    return Container(
      color: const Color.fromARGB(179, 242, 228, 228),
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
          child: imageList[index],
        ),
      ),
    );
  }

  Widget imageContainer(String assetName,BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width*0.28,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        assetName,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }
}
