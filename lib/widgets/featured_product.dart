import 'package:flutter/material.dart';
import 'package:rynsysengineering/screens/product_detail_screen.dart';
import 'package:rynsysengineering/screens/product_list.dart';
import 'package:rynsysengineering/util/product_detail_service.dart';

import '../providers/product/product.dart';
import '../util/home_products_service.dart';

class FeaturedProduct extends StatelessWidget {
  FeaturedProduct({Key? key}) : super(key: key);
  final TextStyle textStyle = const TextStyle(fontSize: 22);
  @override
  Widget build(BuildContext context) {
    final appBarHeight = MediaQuery.of(context).size.height * 0.06;
    final size = MediaQuery.of(context).size;
    return SizedBox(
      // height:MediaQuery.of(context).size.height*0.4,
      width: double.infinity,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            'Featured Products',
            style: textStyle,
          ),
          InkWell(
              onTap: (() => Navigator.of(context)
                  .pushNamed(ProductListScreen.productListRoute)),
              child: Text('View all',
                  style: textStyle.copyWith(color: Colors.orange))),
        ]),
        FutureBuilder<ProductList>(
          future: ProductService().fetchProducts(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.done){
              if (snapshot.hasData) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.55 -
                    appBarHeight -
                    107,
                child: GridView.builder(
                    itemCount: snapshot.data!.products.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: ((2 / 3) * 0.9),
                    ),
                    itemBuilder: ((context, index) => Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: const Offset(1, 1),
                                    blurRadius: 5,
                                    spreadRadius: 2),
                              ]),
                          child: InkWell(
                            onTap: () {
                              ProductDetailService().fetchProductDetail(snapshot.data!.products[index].id)
                              .then((_) => Navigator.of(context).pushNamed(
                                ProductDetailScreen.productDetailRoute,arguments:snapshot.data!.products[index].id ));
                               },
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    height: 150,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image:  DecorationImage(
                                          image: NetworkImage(snapshot.data!.products[index].images.path),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                ),
                                 Expanded(
                                  flex: 2,
                                  child: Text(
                                    snapshot.data!.products[index].name,
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.star),
                                        onPressed: () {},
                                        color: Colors.orange,
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.star),
                                        onPressed: () {},
                                        color: Colors.orange,
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.star),
                                        onPressed: () {},
                                        color: Colors.orange,
                                      ),
                                      // IconButton(
                                      //   icon: const Icon(Icons.star),
                                      //   onPressed: () {},
                                      //   color: Colors.orange,
                                      // ),
                                      // IconButton(
                                      //   icon: const Icon(Icons.star),
                                      //   onPressed: () {},
                                      // ),
                                    ],
                                  ),
                                ),
                                 Text( snapshot.data!.products[index].price.toString()+ ' ETB',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                                //  const SizedBox(
                                //     height: 5,
                                //   ),
                                Expanded(
                                  child: Container(),
                                ),
                                Container(
                                  width: 130,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                      child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(
                                      'Add to cart',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20),
                                    ),
                                  )),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                          ),
                      ))),
              );
            }
              else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            }
            
            return const Center(child:  CircularProgressIndicator());
          },
        ),
      ]),
    );
  }
}
