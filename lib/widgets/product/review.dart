import 'package:flutter/material.dart';

class ProductReview extends StatefulWidget {
  const ProductReview({ Key? key }) : super(key: key);

  @override
  State<ProductReview> createState() => _ProductReviewState();
}

class _ProductReviewState extends State<ProductReview> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Product Review'),   
    );
  }
}