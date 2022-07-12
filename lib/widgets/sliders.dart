import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';
//import 'package:carousel_pro/carousel_pro.dart';
class ImageSliders extends StatelessWidget {
  const ImageSliders({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: Carousel(
        images:[
          Image.asset('assets/images/solar panel1.png'),
          Image.asset('assets/images/solar panel2.jpg'),
          Image.asset('assets/images/solar panel3.jpg'),
        ],
        autoplay: true,
        dotSize:100,
        boxFit: BoxFit.cover,
        dotColor: Colors.orange,
        autoplayDuration: const Duration(seconds: 3),
      )
    );
  }
}