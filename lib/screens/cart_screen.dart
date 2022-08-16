import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rynsysengineering/providers/product/cart_list.dart';
import 'package:rynsysengineering/screens/checkout_screen.dart';
import 'package:rynsysengineering/widgets/button_container.dart';

import '../models/cart_item_model.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const cartRoute = 'cartRoute';
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  TextStyle bigTextStyle =
      const TextStyle(fontSize: 23, fontWeight: FontWeight.w500);
  TextStyle smallTextStyle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  Color iconColor = Colors.orange;
  int _counter = 1;
  void increaseProduct() {
    setState(() {
      _counter++;
    });
  }

  void decreaseProduct() {
    setState(() {
      if (_counter <= 1) {
        _counter = 1;
      } else {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context);
    List<CartItem> cartList = cart.cartItems.values.toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Shopping Cart',
                  style: bigTextStyle,
                ),
                Text(cart.getItemCount.toString() + ' Items',
                    style: bigTextStyle),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(
              color: Colors.black,
              thickness: 2,
            ),
            cart.getItemCount != 0
                ? Expanded(
                    child: ListView.builder(
                      itemCount: cart.cartItems.length,
                      itemBuilder: (context, index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                cartList[index].imgUrl,
                                width: 120,
                                height: 120,
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  children: [
                                    Text(cartList[index].name,
                                        style: smallTextStyle),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: iconColor,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: iconColor,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: iconColor,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: iconColor,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: iconColor,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      cartList[index].price + ' ETB',
                                      style: bigTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          increaseProduct();
                                        },
                                        icon: const FaIcon(
                                            FontAwesomeIcons.plus)),
                                    Container(
                                        height: 30,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              style: BorderStyle.solid,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                            child: Text(
                                          cartList[index].quantity,
                                          style: const TextStyle(
                                              fontSize: 21,
                                              fontWeight: FontWeight.bold),
                                        ))),
                                    IconButton(
                                        onPressed: () {
                                          decreaseProduct();
                                        },
                                        icon: const FaIcon(
                                            FontAwesomeIcons.minus)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              cart.removeCartItem(cartList[index].cartId);
                            },
                            child:const ButtonContainer(color: Color(0xff84BD3A), title: 'Revove') ,
                          ),
                          Divider(
                              thickness: 1,
                              color: Colors.black.withOpacity(0.4))
                        ],
                      ),
                    ),
                  )
                : const Expanded(
                  child:  Center(
                      child: Text(
                        'There is no product !!!',
                        style: TextStyle(color: Colors.deepOrange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      'Total:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      cart.getTotalPrice.toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(checkoutScreen.routeName);
                  },
                  child: const ButtonContainer(color: Colors.orange, title: 'Checkout',)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
