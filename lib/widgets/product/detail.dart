import 'package:flutter/material.dart';

class ProductDetailWidget extends StatelessWidget {
  const ProductDetailWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
        const Text('This is all about the description of the product,'
         'please say something about our proudct never miss it'
        'never say no about the product',
        style: TextStyle(fontSize:18),
        ),
       const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: MediaQuery.of(context).size.height*0.06,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              )),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.06,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Buy now',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              )),
            ),
          ]),
       ],
    );
  }
}