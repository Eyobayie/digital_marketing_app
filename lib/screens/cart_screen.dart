
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rynsysengineering/providers/product/cart_list.dart';

import '../models/cart_item_model.dart';

class CartScreen extends StatefulWidget {
   const CartScreen({Key? key}) : super(key: key);
static const cartRoute='cartRoute';
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
TextStyle bigTextStyle=const TextStyle(fontSize: 20,fontWeight: FontWeight.w500);
TextStyle smallTextStyle=const TextStyle(fontSize: 18,fontWeight: FontWeight.w400);
Color iconColor= Colors.orange;
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
    final Cart cart=Provider.of<Cart>(context);
List<CartItem> cartList=cart.cartItems.values.toList();
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
      body: Container(
          margin:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Column(
          children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Text('Shopping Cart',style: bigTextStyle,),
            Text(cart.getItemCount.toString(),style:bigTextStyle),
          ],),
          const SizedBox(height: 5,),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) => Column(
                crossAxisAlignment:CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                    Image.network(cartList[index].imgUrl,width: 120, height: 120,),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Text(cartList[index].name,style:smallTextStyle),
                          Row(children: [
                                         Icon(Icons.star,color: iconColor,),
                                         Icon(Icons.star,color: iconColor,),
                                         Icon(Icons.star,color: iconColor,),
                                         Icon(Icons.star,color: iconColor,),
                                         Icon(Icons.star,color: iconColor,),  
                                   ],),
                              Text(cartList[index].price +' ETB',style: bigTextStyle,),
                              ],
                           ),
                    ),
                   Expanded(
                    flex: 0,
                     child: Column(
                      children: [
                        IconButton(onPressed:() {
                         increaseProduct();
                          }, icon: const FaIcon(FontAwesomeIcons.plus)),
                          Container(
                        height: 30,
                        width: 40,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.6),
                              style: BorderStyle.solid,
                              width: 1,
                            ),
                            borderRadius:BorderRadius.circular(5)),
                        child:  Center(
                            child: Text(
                         cartList[index].quantity,
                          style:const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                        ))),
                         IconButton(onPressed: (){decreaseProduct();}, icon: const FaIcon(FontAwesomeIcons.minus)),
                      ],),
                   ),
                  ],),
              InkWell(
                onTap: (){
                  cart.removeCartItem(cartList[index].cartId);
                },
                child: Container(
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
              ),
                Divider(thickness: 1,color:Colors.black.withOpacity(0.4))
                ],
              ),
            ),
          ),
           Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                const Text('Total:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 8,),
                Text(cart.getTotalPrice.toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],),
              InkWell(
                onTap: (){
                  
                },
                child: Container(
                      width: MediaQuery.of(context).size.height*0.3,
                      height: MediaQuery.of(context).size.height*0.065,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Text(
                           'Checkout',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                           ),
                         )),
                      ),
                 ),
              ],),
        ],),
      ),
    );
  }
}