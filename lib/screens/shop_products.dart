import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rynsysengineering/screens/product_detail_screen.dart';
import 'package:rynsysengineering/util/category_product_service.dart';
import '../providers/product/cart_list.dart';
import '../providers/product/category_products.dart';
import '../widgets/button_container.dart';
class ShopProducts extends StatelessWidget {
  const ShopProducts({Key? key}) : super(key: key);
  static const routeName='shopProducts';
  @override
  Widget build(BuildContext context) {
    final productId=ModalRoute.of(context)!.settings.arguments as int;
     return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, 
        icon:const Icon(Icons.arrow_back_ios,size: 30,color:Colors.black),
        ),
        centerTitle: true,
        title: Text('Shop $productId',
        style:const TextStyle(color: Colors.black),),),
       body: FutureBuilder<CatProductList>(
        future: CategoryProductService().fetchCategoryProducts(productId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 30,
                    child: Center(child: Text(snapshot.data!.categoryproducts.length.toString() + ' Products',
                    style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 18) ,)),
                  ),
                  Expanded(
                    child: GridView.builder(
                        itemCount: snapshot.data!.categoryproducts.length,
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: ((2 / 3)),
                        ),
                        itemBuilder: ((context, index) => Container(
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
                                              snapshot.data!.categoryproducts[index].id);
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
                                                    .categoryproducts[index].photo!.path),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          
                                          snapshot.data!.categoryproducts[index].name
                                                      .length >=
                                                  31
                                              ? snapshot
                                                  .data!.categoryproducts[index].name
                                                  .substring(0, 30)
                                              : snapshot
                                                  .data!.categoryproducts[index].name,
                                          style: const TextStyle(fontSize: 16),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
     
                                        Text(
                                            snapshot.data!.categoryproducts[index].price
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
                                                          .categoryproducts[index].id,
                                                      snapshot.data!
                                                          .categoryproducts[index].name,
                                                      snapshot.data!
                                                          .categoryproducts[index].price,
                                                      snapshot
                                                          .data!
                                                          .categoryproducts[index]
                                                          .photo!
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
                            )),
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
         ),
     );
  }
}