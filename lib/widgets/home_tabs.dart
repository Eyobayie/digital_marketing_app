import 'package:flutter/material.dart';

class HomeTabs extends StatelessWidget {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 4,
      child: Container(
        color:Colors.blue,
        height: 500,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 0,
        backgroundColor:const  Color.fromARGB(255, 7, 42, 70),
            elevation:0,
            bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.location_city_outlined),
                text: 'Shop locator',
              ),
              Tab(
                icon: Icon(Icons.shopping_cart),
                text: 'Cart',
              ),
              Tab(
                icon: Icon(Icons.account_box),
                text: 'Account',
              ),
            ],
          ),
          ),
          body: TabBarView(children: [
            Container(
              height: 500,
              color: Colors.black12,
              child: const Text('Home'),),
            Container(
               height: 500,
              color: Colors.deepOrange,
              child: const Text('Shop locator'),),
            Container(
              height: 500,
              color: Colors.purple,
              child: const Text('Cart'),),
            Container(
              height: 500,
              color: Colors.white,
              child: const Text('Account'),),
          ]), 
        ),
      ),
    );
  }
}
