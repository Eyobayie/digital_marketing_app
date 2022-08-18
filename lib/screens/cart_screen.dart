import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:rynsysengineering/providers/product/cart_list.dart';
import 'package:rynsysengineering/screens/checkout_screen.dart';
import 'package:rynsysengineering/util/payment_types_service.dart';
import 'package:rynsysengineering/util/shop_service.dart';
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
  void increaseProduct(int maximumQuantity) {
    setState(() {
      if (_counter <= maximumQuantity) {
        _counter++;
      }
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
                                        getIcon(Icons.star, Colors.orange),
                                        getIcon(Icons.star, Colors.orange),
                                        getIcon(Icons.star, Colors.orange),
                                        getIcon(Icons.star, Colors.orange),
                                        getIcon(Icons.star, Colors.orange),
                                      ],
                                    ),
                                    Text(
                                      cartList[index].price.toString() + ' ETB',
                                      style: bigTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 0,
                                child: Consumer(
                                  builder: (context, _, child) => Column(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              cartList[index].quantity++;
                                            });
                                          },
                                          icon: const FaIcon(
                                              FontAwesomeIcons.plus)),
                                      Container(
                                          height: 30,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.6),
                                                style: BorderStyle.solid,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Center(
                                              child: Text(
                                            cartList[index].quantity.toString(),
                                            style: const TextStyle(
                                                fontSize: 21,
                                                fontWeight: FontWeight.bold),
                                          ))),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (cartList[index].quantity <=
                                                  1) {
                                                cartList[index].quantity = 1;
                                              } else {
                                                cartList[index].quantity--;
                                              }
                                            });
                                          },
                                          icon: const FaIcon(
                                          FontAwesomeIcons.minus)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {
                              cart.removeCartItem(
                                  cart.cartItems.keys.toList()[index]);
                            },
                            child: Container(
                              width: 160,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: MediaQuery.of(context).size.height * 0.06,
                              decoration: BoxDecoration(
                                color: const Color(0xff84BD3A),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  'Remove',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              )),
                            ),
                            // child:const ButtonContainer(color: Color(0xff84BD3A), title: 'Remove'),
                          ),
                          Divider(
                              thickness: 1,
                              color: Colors.black.withOpacity(0.4))
                        ],
                      ),
                    ),
                  )
                : const Expanded(
                    child: Center(
                      child: Text(
                        'There is no product !!!',
                        style: TextStyle(
                          color: Colors.deepOrange,
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
                   cart.getTotalPrice!=0.0?
                   Navigator.of(context).pushNamed(CheckoutScreen.routeName,arguments: cartList)
                   .then((value) => cart.removeAll())
                   : ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Add product to order')));},
                    child: const ButtonContainer(
                      color: Colors.orange,
                      title: 'Checkout',
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getIcon(IconData iconData, Color color) {
    return Icon(
      Icons.star,
      color: iconColor,
    );
  }
}
