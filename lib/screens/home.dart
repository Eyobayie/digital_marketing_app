import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rynsysengineering/constants/text_decorators.dart';
import 'package:rynsysengineering/screens/product_list.dart';
import 'package:rynsysengineering/util/home_products_service.dart';
import 'package:rynsysengineering/widgets/featured_product.dart';
import 'package:rynsysengineering/widgets/search_field.dart';
import '../providers/product/cart_list.dart';
import '../widgets/badge.dart';
import '../widgets/shop.dart';
import '../widgets/sliders.dart';
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    ProductService().fetchProducts();
  }

  

  @override
  Widget build(BuildContext context) {
    final appBarHeight=MediaQuery.of(context).size.height *0.06;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:const  Color(0xff062539),
        shadowColor: const  Color(0xff062539),
        toolbarHeight: appBarHeight,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Text('RENSYS',
          style:TextDecorators.companyNameStyle
          .copyWith(color:Colors.orange,     
          )),Text('ENGINEERING',
          style:TextDecorators.companyNameStyle
          .copyWith(color:Colors.green,
          ))],),
      actions: [
        IconButton(onPressed: (){
          //Navigator.of(context).pushNamed(ProductListScreen.productListRoute);
        }, icon:const Icon(Icons.search,size: 30,) ),
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: Consumer<Cart>(
            builder: (context,cart,_)=>
             Badge(
            child:IconButton(icon:const Icon(Icons.shopping_cart_outlined,size: 30,),
                 onPressed: (){
                 },
                 ),
            value: cart.getItemCount.toString(),
            labelStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )],
      ),
      body: Column(
        children: [ 
              ImageSliders(),
             const  Shop(),
             const FeaturedProduct(),
         ],
      ),
    );
  }
}