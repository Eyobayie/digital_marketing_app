import 'package:flutter/material.dart';
import 'package:rynsysengineering/screens/account.dart';
import 'package:rynsysengineering/screens/cart_screen.dart';
import 'package:rynsysengineering/screens/home.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorScreenState();
}

class _BottomNavigatorScreenState extends State<BottomNavigatorScreen> {
   int initialIndex=0;
   final TextStyle labelStyle=const TextStyle(fontSize:20);
  List<Widget> widgetList= [
    const Home(),
    Container(child:const Center(child: Text('Shop locattor'))),
    CartScreen(),
    AccountScreen(),
    //Container(child:const Center(child: Text('Account'))),
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetList[initialIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.white,
        backgroundColor:const  Color.fromARGB(255, 7, 42, 70),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedFontSize:20,
        unselectedFontSize: 20,
        iconSize: 30,
        currentIndex: initialIndex,
        type: BottomNavigationBarType.fixed,     
        onTap: (selectedIndex){
          setState(() {
          initialIndex=selectedIndex;
          });
        },
        items: const[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label:'Home'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on_outlined),
          label:'Shop locattor',),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label:'Cart'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label:'Accont'),
      ]),
    );
  }
}