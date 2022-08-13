import 'package:flutter/material.dart';
import 'package:rynsysengineering/providers/product/productdetailprovider.dart';
import 'package:rynsysengineering/widgets/product/detail.dart';
import 'package:rynsysengineering/widgets/product/quantity.dart';
import 'package:rynsysengineering/widgets/product/review.dart';

class ProductTabs extends StatefulWidget {
  ProductDetail? productDetail;
  // final String ProductDetail;
  // final int maximumProductQuantity;
   ProductTabs(
      {Key? key,
     required this.productDetail})
      : super(key: key);
  @override
  State<ProductTabs> createState() => _ProductTabsState();
}

class _ProductTabsState extends State<ProductTabs> {
  List<String> aboutProduct = ['Product', 'Detail', 'Review'];
  late List<Widget> tabList;
  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabList = [
      ProductQuantity(productDetail: widget.productDetail),
      ProductDetailWidget(productDetail:widget.productDetail),
      const ProductReview()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 1,
          color: Colors.white,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: aboutProduct.length,
            itemBuilder: (context, index) => Center(
                child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? const Color.fromARGB(255, 7, 42, 70)
                    : Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 5,
                    ),
                    child: Text(
                      aboutProduct[index],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            )),
          ),
        ),
        tabList[selectedIndex],
      ],
    );
  }
}
