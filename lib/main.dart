import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rynsysengineering/providers/product/cart_list.dart';
import 'package:rynsysengineering/providers/product/order_list.dart';
import 'package:rynsysengineering/screens/bottom_navigator.dart';
import 'package:rynsysengineering/screens/cart_screen.dart';
import 'package:rynsysengineering/screens/checkout_screen.dart';
import 'package:rynsysengineering/screens/product_detail_screen.dart';
import 'package:rynsysengineering/screens/product_list.dart';
import 'package:rynsysengineering/screens/shop_products.dart';
import 'package:rynsysengineering/widgets/confirmation.dart';
import 'package:rynsysengineering/widgets/delivery_address.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[ChangeNotifierProvider(
        create:(context)=>Cart(),),
        ChangeNotifierProvider(
        create:(context)=>Orders())],
        child: MaterialApp(
          title: 'RENYSYS ENGINEERING',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            inputDecorationTheme:const InputDecorationTheme(
              filled: true, fillColor: Colors.white,
              ),
            ),
          home: const BottomNavigatorScreen(),
          routes: {
            ProductDetailScreen.productDetailRoute:(context)=>const ProductDetailScreen(),
            ProductListScreen.productListRoute:(context)=> ProductListScreen(),
            CartScreen.cartRoute:(context) => const CartScreen(),
            CheckoutScreen.routeName:(context) =>  CheckoutScreen(),
            ShopProducts.routeName:(context)=>const ShopProducts(),
          },
        ),
      );
  }
}

