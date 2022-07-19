import 'package:flutter/material.dart';
import 'package:rynsysengineering/screens/product_detail_screen.dart';

import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RENYSYS ENGINEERING',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        inputDecorationTheme:const InputDecorationTheme(
          filled: true, fillColor: Colors.white,
        )
      ),
      home:const ProductDetailScreen(),
      // home: const Home(),
    );
  }
}

