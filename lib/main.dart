import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rynsysengineering/providers/product/cart_list.dart';
import 'package:rynsysengineering/screens/bottom_navigator.dart';
import 'package:rynsysengineering/screens/cart_screen.dart';
import 'package:rynsysengineering/screens/checkout_screen.dart';
import 'package:rynsysengineering/screens/product_detail_screen.dart';
import 'package:rynsysengineering/screens/product_list.dart';
import 'package:rynsysengineering/widgets/confirmation.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create:(context)=>Cart(),
      child: MaterialApp(
        title: 'RENYSYS ENGINEERING',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          inputDecorationTheme:const InputDecorationTheme(
            filled: true, fillColor: Colors.white,
            ),
          ),
        home: const checkoutScreen(),
        routes: {
          ProductDetailScreen.productDetailRoute:(context)=>const ProductDetailScreen(),
          ProductListScreen.productListRoute:(context)=> ProductListScreen(),
          CartScreen.cartRoute:(context) => const CartScreen(),
        },
      ),
    );
  }
}

