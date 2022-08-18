
import 'package:flutter/material.dart';
import 'package:rynsysengineering/models/cart_item_model.dart';
import 'package:rynsysengineering/widgets/confirmation.dart';
import 'package:rynsysengineering/widgets/delivery_address.dart';
import 'package:rynsysengineering/widgets/login_form.dart';
import 'package:rynsysengineering/widgets/payment.dart';

class checkoutScreen extends StatelessWidget {
  final  List<CartItem>? cartList;
   int? productId;
   int? productQuantity;
   checkoutScreen({Key? key, this.cartList}) : super(key: key);
  final textStyle = const TextStyle(fontSize: 23, fontWeight: FontWeight.bold);
  static const routeName='checkoutRoute';
  @override
  Widget build(BuildContext context) {
    List<CartItem> cartList=ModalRoute.of(context)!.settings.arguments as List<CartItem>;
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios,
                color: Colors.black,
                size: 25,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          title:  Text('Checkout' + '( 1/4)',
          style: textStyle.copyWith(color: Colors.black),),
          toolbarHeight: 50,
          bottom:  const TabBar(
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            labelStyle: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.black,
            tabs:[
            Tab(
              icon: Icon(Icons.circle_outlined,),
              height: 70,
              text: 'Sign in',
              iconMargin: EdgeInsets.symmetric(vertical: 5),
              ),
                Tab(
              icon: Icon(Icons.circle_outlined,),
              height: 70,
              text: 'Delivery address',
              iconMargin: EdgeInsets.symmetric(vertical: 5),
              ),
                Tab(
              icon: Icon(Icons.circle_outlined,),
              height: 70,
              text: 'Payment',
              iconMargin: EdgeInsets.symmetric(vertical: 5),
              ),
                Tab(
              icon: Icon(Icons.circle_outlined,),
              height: 70,
              text: 'confirmation',
              iconMargin: EdgeInsets.symmetric(vertical: 5),
              ),
          ]),
        ),
        body:  TabBarView(children: [
           LoginForm(),
            DeliveryAddressWidget(),
            PaymentWidget(cartList: cartList),
           const Confirmation(),
        ]),
      ),
    );
  }
}
