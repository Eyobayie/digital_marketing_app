import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:rynsysengineering/providers/product/productdetailprovider.dart';

import '../../providers/product/cart_list.dart';
class ProductDetailWidget extends StatelessWidget {
  ProductDetail? productDetail;
    ProductDetailWidget({ Key? key,  this.productDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Detail',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
         Html(
          data: productDetail!.detail,       
           ),
       const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Consumer<Cart>(
              builder:(context,cart,_)=>
               InkWell(
                onTap: (){
                  cart.addItem(
                    productDetail!.id.toString(),
                    productDetail!.name,
                    productDetail!.price,
                    productDetail!.allPhotos.imageList![0].path,
                    );
                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.06,
                  decoration: BoxDecoration(
                    color:const Color(0xff84BD3A),
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
              ),
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
              ),),
            ),
          ]),
       ],
    );
  }
}