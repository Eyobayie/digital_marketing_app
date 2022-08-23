import 'dart:io';
import 'package:flutter/material.dart';
import 'package:rynsysengineering/screens/shop_products.dart';
import '../screens/shop_map_view.dart';

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(179, 242, 228, 228),
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ShopMapView()));
            },
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 15, left: 5),
                  height: 150,
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/shop2.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                const Positioned(
                  child: Text(
                    'Go local',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  top: 5,
                  left: 10,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ShopProducts.routeName, arguments: 2);
            },
            child: Stack(
              children: [
                Container(
                  height: 150,
                  padding: const EdgeInsets.only(right: 15),
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/shop1.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                const Positioned(
                  child: Text(
                    'Solar Water \n Pump',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  top: 5,
                  left: 5,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ShopProducts.routeName, arguments: 6);
            },
            child: Stack(
              children: [
                Container(
                  height: 150,
                  padding: const EdgeInsets.only(right: 15),
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/shop3.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                const Positioned(
                  child: Text(
                    'Solar TV \n System',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  top: 5,
                  left: 5,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(ShopProducts.routeName, arguments: 9);
            },
            child: Stack(
              children: [
                Container(
                  height: 150,
                  padding: const EdgeInsets.only(right: 15),
                  width: MediaQuery.of(context).size.width * 0.28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    'assets/images/shop4.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                const Positioned(
                  child: Text(
                    'Solar Home \n System',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  top: 5,
                  left: 5,
                )
              ],
            ),
          ),
        ],
      ),
      // child: ListView.builder(
      //   scrollDirection: Axis.horizontal,
      //   itemCount: imageList.length,
      //   itemBuilder: (context, index) => Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8),
      //     child: imageList[index],
      //   ),
    );
  }

  // Widget imageContainer(String assetName, BuildContext context) {
  //   return Container(
  //     height: 150,
  //     width: MediaQuery.of(context).size.width * 0.28,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: Image.asset(
  //       assetName,
  //       fit: BoxFit.cover,
  //       width: double.infinity,
  //     ),
  //   );
  // }
}
