import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rynsysengineering/providers/product/cart_list.dart';
import 'package:rynsysengineering/screens/product_detail_screen.dart';
import 'package:rynsysengineering/screens/product_list.dart';
import 'package:rynsysengineering/widgets/button_container.dart';
import '../providers/product/product.dart';
import '../util/home_products_service.dart';

class FeaturedProduct extends StatelessWidget {
  const FeaturedProduct({Key? key}) : super(key: key);
  final TextStyle textStyle = const TextStyle(fontSize: 22);
  final iconColor = Colors.orange;
  @override
  Widget build(BuildContext context) {
    // final appBarHeight = MediaQuery.of(context).size.height * 0.06;
    // final size = MediaQuery.of(context).size;
    return FutureBuilder<ProductList>(
      future: ProductService().fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Featured Products',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        InkWell(
                            onTap: (() => Navigator.of(context).pushNamed(
                                ProductListScreen.productListRoute,
                                arguments: snapshot.data)),
                            child: const Text('View all',
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 16))),
                      ]),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.36,
                  child: GridView.builder(
                      itemCount: snapshot.data!.products.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: ((2 / 3)),
                      ),
                      itemBuilder: ((context, index) => snapshot
                                  .data!.products[index].isFeatured ==
                              1
                          ? Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
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
                                    Navigator.of(context).pushNamed(
                                        ProductDetailScreen.productDetailRoute,
                                        arguments:
                                            snapshot.data!.products[index].id);
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 120,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                            
                                              image: NetworkImage(snapshot.data!
                                                  .products[index].images.path),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        
                                        snapshot.data!.products[index].name
                                                    .length >=
                                                31
                                            ? snapshot
                                                .data!.products[index].name
                                                .substring(0, 30)
                                            : snapshot
                                                .data!.products[index].name,
                                        style: const TextStyle(fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),

                                      Text(
                                          snapshot.data!.products[index].price
                                                  .toString() +
                                              ' ETB',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      //  const SizedBox(
                                      //     height: 5,
                                      //   ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Consumer<Cart>(
                                        builder: (context, cart, child) =>
                                            InkWell(
                                                onTap: () {
                                                  cart.addItem(
                                                    snapshot.data!
                                                        .products[index].id,
                                                    snapshot.data!
                                                        .products[index].name,
                                                    snapshot.data!
                                                        .products[index].price,
                                                    snapshot
                                                        .data!
                                                        .products[index]
                                                        .images
                                                        .path,
                                                  );
                                                },
                                                child: const ButtonContainer(
                                                    color: Colors.orange,
                                                    title: 'Add to cart')),
                                      ),
      
                                    ],
                                  )),
                            )
                          : Container())),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
        }
        return const Center(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: CircularProgressIndicator(),
        ));
      },
    );
  }
}
