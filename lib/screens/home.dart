import 'package:flutter/material.dart';
import 'package:rynsysengineering/constants/text_decorators.dart';
import 'package:rynsysengineering/widgets/search_field.dart';

import '../widgets/sliders.dart';
class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appBarHeight=MediaQuery.of(context).size.height *0.06;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor:const  Color.fromARGB(255, 7, 42, 70),
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
      actions: [IconButton(
        onPressed: (){
        },
       icon: const Icon(Icons.notifications))],
      ),
      body: ListView(
       // padding: const EdgeInsets.symmetric(horizontal:10,vertical: 5),
        children: const[
          SearchField(),
          ImageSliders(),
        ],
      ),
    );
  }
}