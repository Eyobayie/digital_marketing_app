import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rynsysengineering/widgets/product/detail.dart';

class CartScreen extends StatefulWidget {
   CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
TextStyle bigTextStyle=const TextStyle(fontSize: 20,fontWeight: FontWeight.w500);
TextStyle smallTextStyle=const TextStyle(fontSize: 18,fontWeight: FontWeight.w400);
int _counter=1;
void increaseProduct(){
  setState(() {
    _counter++;
  });
}
void decreaseProduct(){
  setState(() {
    if(_counter<=1){
      _counter=1;
    }
    else{
      _counter--;
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.white,
        automaticallyImplyLeading:false,
        title:  Text('Back',style:bigTextStyle.copyWith(color: Colors.black)),
        toolbarHeight: 50,
        leading: IconButton(onPressed: (){
        }, 
        icon: const Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: ListView(
        padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Shopping Cart',style: bigTextStyle,),
          Text('3 Products',style:bigTextStyle),
        ],),
        SizedBox(
          height: MediaQuery.of(context).size.height-100,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) => Column(
              crossAxisAlignment:CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                  Image.asset('assets/images/solar panel3.jpg',width: 120,
                  height: 120,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text('portable energy portable energy',style:smallTextStyle),
                        Row(children: [
                                 IconButton(
                                          icon: const Icon(Icons.star),
                                          onPressed: () {
                                          },
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
                                 ],),
                            Text('2000 ETB',style: bigTextStyle,),
                            ],
                         ),
                  ),
                 Expanded(
                  flex: 0,
                   child: Column(
                    children: [
                      IconButton(onPressed: (){increaseProduct();}, icon: const FaIcon(FontAwesomeIcons.plus)),
                                 Container(
                      height: 30,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.6),
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5)),
                      child:  Center(
                          child: Text(
                        '$_counter',
                        style:const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                      ))),
                       IconButton(onPressed: (){decreaseProduct();}, icon: const FaIcon(FontAwesomeIcons.minus)),
                    ],),
                 ),
                ],),
            Container(
              width: 160,
              height: MediaQuery.of(context).size.height*0.06,
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Remove',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                   ),
                 )),
              ),
              Divider(thickness: 1,color:Colors.black.withOpacity(0.7))
              ],
            ),
            ),
         ),
      ],),
    );
  }
}