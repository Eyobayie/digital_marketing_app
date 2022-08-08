import 'package:flutter/material.dart';
import 'package:rynsysengineering/constants/text_decorators.dart';
import 'package:rynsysengineering/util/home_products_service.dart';
import 'package:rynsysengineering/widgets/featured_product.dart';
import 'package:rynsysengineering/widgets/search_field.dart';
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
        backgroundColor:const  Color.fromARGB(255, 7, 42, 70),
        shadowColor: const  Color.fromARGB(255, 7, 42, 70),
        toolbarHeight: appBarHeight,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text('RENSYS',
          style:TextDecorators.companyNameStyle
          .copyWith(color:Colors.orange,     
          )),Text('ENGINEERING',
          style:TextDecorators.companyNameStyle
          .copyWith(color:Colors.green,
          ))],),
      actions: [
        Badge(
        child:IconButton(icon:const Icon(Icons.notifications,size: 30,),
             onPressed: (){
             },
             ),
        value: '20',
        )],
      ),
      body: Column(
       // padding: const EdgeInsets.symmetric(horizontal:10,vertical: 5),
        children: [
           SearchField(
            textFieldHeight: MediaQuery.of(context).size.height*0.07,
            width: MediaQuery.of(context).size.width*0.9,
            containerHeight:MediaQuery.of(context).size.height*0.09,
             ),
              ImageSliders(),
             const  Shop(),
             FeaturedProduct(),
         ],
      ),
    );
  }
}