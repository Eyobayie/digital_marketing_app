import 'package:flutter/material.dart';
class ImageSliders extends StatelessWidget {
  const ImageSliders({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
   List<Widget> imageList=[
    Image.asset('assets/images/solar panel1.png'),
    Image.asset('assets/images/solar panel2.jpg'),
    Image.asset('assets/images/solar panel3.jpg'),
    ];
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.15,
      width: double.infinity,
      child: Container(
        color: Colors.green,
      )
      );
  }
}