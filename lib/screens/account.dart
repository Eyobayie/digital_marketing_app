import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:rynsysengineering/widgets/account_container.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({Key? key}) : super(key: key);
  TextStyle BigTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 23,
    fontWeight: FontWeight.bold,
    letterSpacing: 1.7,
  );
  TextStyle commonStyle = const TextStyle(
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {
    final horizontalPadding= MediaQuery.of(context).size.width*0.05;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 42, 70),
      appBar: AppBar(
        title: Text(
          'Account',
          style: BigTextStyle,
        ),
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 7, 42, 70),
        shadowColor: const Color.fromARGB(255, 7, 42, 70),
      ),
      body: ListView(
        children: [
          Container(
            margin:const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row( 
                  children:[
                  const CircleAvatar(
                  backgroundImage:  AssetImage('assets/images/profile.jpg'),
                  radius: 30,
                ),
                const SizedBox(width: 20,),
                Column(
                  children: [
                    Text(
                      'Dean Henderson',
                      style: commonStyle.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                   const SizedBox(height: 15,),
                    Text(
                      '+251 991019921',
                      style: commonStyle.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                ]), 
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 30,
                  ),
                )
              ],
            ),
          ),
          Container(
          margin:  EdgeInsets.symmetric(horizontal: horizontalPadding,vertical:15),
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:BorderRadius.circular(10),
            boxShadow: const [BoxShadow(
              color: Color(0xf4a4b4d),
              offset: Offset(3, 3),
              spreadRadius: 3,
            )]
          ),
          child: Column(
            children: [
               const ListTile(leading:  Icon(Icons.location_on_outlined) ,
             title: Text('Shopping address'),
            ),
            Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
            const ListTile(leading:  Icon(Icons.location_on_outlined) ,
             title: Text('Shopping address'),
             ),
             Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
                            const ListTile(leading:  Icon(Icons.location_on_outlined) ,
             title: Text('Shopping address'),
            ),
            Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
            const ListTile(leading:  Icon(Icons.location_on_outlined) ,
             title: Text('Shopping address'),
             ),
             Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
                            const ListTile(leading:  Icon(Icons.location_on_outlined) ,
             title: Text('Shopping address'),
            ),
            Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
            const ListTile(leading:  Icon(Icons.location_on_outlined) ,
             title: Text('Shopping address'),
             ),
             Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
             
                ],),
             ),
          ],
       ),
    );
  }
}
