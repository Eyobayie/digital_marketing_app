
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rynsysengineering/providers/product/order_list.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/cart_item_model.dart';
import '../providers/product/cart_list.dart';

class PaymentWidget extends StatefulWidget {
  final List<CartItem> cartList;
   PaymentWidget({Key? key,required this.cartList,}) : super(key: key);

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
    String? dropdownValue;
    final textStyle=const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.w500,
      );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
       padding:const EdgeInsets.symmetric(horizontal:10,),
          children: [
           const Divider(color: Colors.black, thickness: 3,),
             Consumer<Cart>(
              builder:(context,cart,_)=>
               ExpansionTile(
                title:  Text('Items',style: textStyle,),
                children: [
                    ListView.builder(
                     shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.cartList.length,
                      itemBuilder: (context,index)=>
                       Column(
                         children: [
                           Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: Colors.grey.withOpacity(0.3),
                                offset: const Offset(1,1),
                                blurRadius: 0,
                                spreadRadius: 0,
                                ),
                              ],
                              ),
                             child: ListTile(
                               leading:   Image.network(widget.cartList[index].imgUrl),
                                title:     Text(widget.cartList[index].name,style:textStyle),
                                subtitle:  Text(widget.cartList[index].quantity.toString(),style: textStyle,),
                                trailing:  Text(widget.cartList[index].price.toString(),style: textStyle,),
                               ),
                              ),
                           const SizedBox(height: 15,),
                         ],
                       ),
                    ),
                ],
                childrenPadding:const EdgeInsets.symmetric(horizontal: 10),
                iconColor: Colors.black,
                onExpansionChanged: (value){
                  if(value){
                     
                   }
                },
                ),
             ),
            ShadowContainer('Shopping','Free'),
            const SizedBox(height: 1,),
            ShadowContainer('Tax','0 ETB'),
             const SizedBox(height: 1,),
            ShadowContainer('Total','3000 ETB'),
             const SizedBox(height: 15,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Column(children: [
                  Text('Choose payment method',style: textStyle,),
                const SizedBox(height:
                 10),
          DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_drop_down),
          iconSize: 30,
          elevation: 5,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.black,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue=newValue;
            });
          },
          items: <String>['Chapa']
          .map<DropdownMenuItem<String>>((String value) {
         return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
               );
             }).toList(),
          )
              ],),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone number',style: textStyle,),
                 const SizedBox(height: 10,),
                 Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.2),
                    width: 2,
                  ),
                    color: Colors.white,
                  ),
                    child: Center(child: Text('+251991019921',style: textStyle,),)
                  ),
              ],),
             ],),
             const SizedBox(height: 20),
             InkWell(
              onTap: ()async{
               final  preferences= await SharedPreferences.getInstance();
               final String? token=preferences.getString('access_token');
               final addressId=preferences.getInt('address_id');
                Provider.of<Orders>(context,listen: false).orderPost(
                  10, 
                  DateTime.now(), 
                  widget.cartList.map((item) => {
                    'id':item.productId,
                    'qty':item.quantity,
                  }).toList(), 
                  108, 
                  19, 
                  4,
                  token,
                  );
              },
               child: Container(
                width: 250,
                height: 40,
                decoration:  BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text('PERCHASE ORDER-3000 ETB',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
               ),
             )
          ],
            ),
    );
  }
  Widget ShadowContainer(String title,String value){
    return   Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(1, 1),
                      blurRadius: 1,
                      spreadRadius: 1),
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:  [
                Text(title,style: textStyle,),
                Text(value,style: textStyle,),
              ],),
           );
      }
  }