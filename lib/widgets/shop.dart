import 'package:flutter/material.dart';
class Shop extends StatelessWidget {
  const Shop({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(179, 242, 228, 228),
      height: MediaQuery.of(context).size.height*0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context,index)=> Padding(
          padding: const EdgeInsets.symmetric(horizontal:6.0,vertical: 8),
          child: Container(
            height: MediaQuery.of(context).size.height*0.15,
            width:MediaQuery.of(context).size.width*0.33,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
             ),
            ),
        ),
      ),
    );
  }
}