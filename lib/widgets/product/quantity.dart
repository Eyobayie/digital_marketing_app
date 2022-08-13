
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../providers/product/productdetailprovider.dart';


class ProductQuantity extends StatefulWidget {
   ProductDetail? productDetail;
   ProductQuantity({Key? key, this.productDetail}) : super(key: key);

  @override
  State<ProductQuantity> createState() => _ProductQuantityState();
}

class _ProductQuantityState extends State<ProductQuantity> {
   int _counter=1;
  
   void reduceQuantity(){
    setState(() {
      if(_counter<1){
        _counter=1;
      }
      else{
        _counter--;
      }
    });
   }
   void increaseQuantity(){
    setState(() {
      if(_counter<int.parse(widget.productDetail!.quantity)){
              _counter++;
      }
      else{
        _counter=int.parse(widget.productDetail!.quantity);
      }
    });
   }
  @override
  Widget build(BuildContext context) {
    final double separetorHeight = MediaQuery.of(context).size.height * 0.04;
    return 
            Container(
              margin: EdgeInsets.symmetric(vertical: separetorHeight),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            const Text('Quantity',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                  letterSpacing: 1.3,
                                )),
                            const SizedBox(height: 10),
                            Text(
                              _counter.toString()+' items',
                              style:const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                letterSpacing: 1.3,
                              ),
                            ),
                          ]),
                      Row(children: [
                        IconButton(
                          icon: const FaIcon(FontAwesomeIcons.minus),
                          onPressed: () {
                            reduceQuantity();
                          },
                        ),
                        Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.teal.shade400,
                                  style: BorderStyle.solid,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                              _counter.toString(),
                              style:  const TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.w900),
                            ))),
                        IconButton(
                          onPressed: () {
                            increaseQuantity();
                          },
                          icon: const FaIcon(FontAwesomeIcons.plus),
                        ),
                      ]),
                    ],
                  ),
                  SizedBox(height: separetorHeight),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.06,
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
                          height: MediaQuery.of(context).size.height * 0.06,
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
          ),
       );    
   }
}
