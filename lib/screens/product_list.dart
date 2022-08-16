import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rynsysengineering/providers/product/cart_list.dart';
import 'package:rynsysengineering/providers/product/product.dart';
import 'package:rynsysengineering/screens/product_detail_screen.dart';
import 'package:rynsysengineering/util/home_products_service.dart';
import 'package:rynsysengineering/widgets/search_field.dart';

import '../util/product_detail_service.dart';
import '../widgets/button_container.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key}) : super(key: key);
  static const productListRoute = 'productListRoute';
  final iconColor = Colors.orange;
  final List<Widget> imageList = [
    Expanded(
      flex: 3,
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/solar panel5.jpg',
              ),
              fit: BoxFit.cover,
            )),
      ),
    ),
    Expanded(
      flex: 3,
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/solar panel6.jpg',
              ),
              fit: BoxFit.cover,
            )),
      ),
    ),
    Expanded(
      flex: 3,
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/solar panel7.jpg',
              ),
              fit: BoxFit.cover,
            )),
      ),
    ),
    Expanded(
      flex: 3,
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: AssetImage(
                'assets/images/solar panel8.jpg',
              ),
              fit: BoxFit.cover,
            )),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final productList =
        ModalRoute.of(context)!.settings.arguments as ProductList;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          shadowColor: Colors.white,
          title: const Text(
            'Back',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          toolbarHeight: 50,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Container(height:10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: size.height * 0.22,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SearchField(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 1,
                    containerHeight: MediaQuery.of(context).size.height * 0.1,
                    textFieldHeight: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Container(
                    color: const Color.fromRGBO(236, 241, 254, 0.059),
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text('Category', style: TextStyle(fontSize: 20)),
                            Icon(Icons.arrow_forward_ios),
                            Text('Home solar', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const FaIcon(
                                  FontAwesomeIcons.filter,
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const FaIcon(FontAwesomeIcons.sortDown)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    productList.products.length.toString() + ' Products',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.67,
              child: GridView.builder(
                  itemCount: productList.products.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                            Navigator.of(context).pushNamed(
                                ProductDetailScreen.productDetailRoute,
                                arguments: productList.products[index].id);
                          },
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.symmetric(vertical:5),
                                height: 150,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(productList
                                           .products[index].images.path),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(height:5),
                              Text(
                                productList.products[index].name.length>=31
                                ?productList.products[index].name.substring(0,30)
                                :productList.products[index].name,
                                style: const TextStyle(fontSize: 18),
                              ),
                                 const SizedBox(height: 5,),
                              SizedBox(
                                height: 30,
                                child: Center(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: iconColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: iconColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: iconColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: iconColor,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: iconColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(productList.products[index].price + ' ETB',
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                height: 5,
                              ),
                              Consumer<Cart>(
                                builder: (context, cart, child) => InkWell(
                                  onTap: () {
                                    cart.addItem(
                                      productList.products[index].id.toString(), 
                                      productList.products[index].name,
                                      productList.products[index].price,
                                      productList.products[index].images.path,
                                      );
                                  },
                                  child:const ButtonContainer(color: Colors.orange, title: 'Add to cart')
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              )
                            ],
                          ),
                        ),
                   ))),
              ),
          ],
      ));
  }
}
