import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:rynsysengineering/providers/product/productdetailprovider.dart';

import '../../providers/product/cart_list.dart';
import '../button_container.dart';
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
                child:  const ButtonContainer(
                    color: Color(0xff84BD3A), title: 'Add to cart'),
              ),
            ),
            const ButtonContainer(
              color: Colors.orange,
              title: 'Buy know',
            )
          ]),
       ],
    );
  }
}