import 'package:flutter/material.dart';
import 'package:rynsysengineering/widgets/product/review_list.dart';
import 'package:rynsysengineering/widgets/search_field.dart';

class ProductReview extends StatefulWidget {
  const ProductReview({Key? key}) : super(key: key);

  @override
  State<ProductReview> createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  @override
  Widget build(BuildContext context) {
    final double separetorHeight = MediaQuery.of(context).size.height * 0.02;
    const TextStyle commonStyle=TextStyle(fontSize: 18);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height:separetorHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.55,
              height: MediaQuery.of(context).size.height*0.06,
              child: SearchField(
                color: Colors.white,
                width:MediaQuery.of(context).size.width*1,
                containerHeight:MediaQuery.of(context).size.height*0.06,
                textFieldHeight: MediaQuery.of(context).size.height*1,
                ),
              ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 7, 42, 70),
              ),
              child: const Center(
                  child: Text(
                'Write review',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )),
            ),
          ],
        ),
        // SizedBox(
        //   height: 250,
        //   child: ReviewList()),
        SizedBox(
          height: 215,
          child: Stack(
            children: [
              ReviewList(), 
               Positioned(
                bottom: 20,
                right:0, 
                left: 0,
                 child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
               ),
            ],
          ),
        ),
        const SizedBox(height:10),
        
      ],
    );
  }
}
