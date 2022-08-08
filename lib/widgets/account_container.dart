import 'package:flutter/material.dart';
class AccountContainer extends StatelessWidget {
  const AccountContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    final horizontalPadding=MediaQuery.of(context).size.width*0.6;
      return Container(
          margin:  EdgeInsets.symmetric(horizontal: horizontalPadding),
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:BorderRadius.circular(10),
            boxShadow: const [BoxShadow(
              color: Colors.red,
             // color: Color(0xf4a4b4d),
              offset: Offset(3, 3),
              spreadRadius: 3,
            )]
          ),
          // child:Column(
          //   children: [
          //   const ListTile(leading:  Icon(Icons.location_on_outlined) ,
          //   title: Text('Shopping address'),
          //   ),
          //   Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
          //    const ListTile(leading:  Icon(Icons.location_on_outlined) ,
          //   title: Text('Shopping address'),
          //   ),
          //   Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
          //    const ListTile(leading:  Icon(Icons.location_on_outlined) ,
          //   title: Text('Shopping address'),
          //   ),
          //   Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
          //    const ListTile(leading:  Icon(Icons.location_on_outlined) ,
          //   title: Text('Shopping address'),
          //   ),
          //   Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
          //    const ListTile(leading:  Icon(Icons.location_on_outlined) ,
          //   title: Text('Shopping address'),
          //   ),
          //   Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
          //    const ListTile(leading:  Icon(Icons.location_on_outlined) ,
          //   // title: Text('Shopping address'),
          //   // ),
          //   // Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
          //   //  const ListTile(leading:  Icon(Icons.location_on_outlined) ,
          //   // title: Text('Shopping address'),
          //   // ),
          //   // Divider(thickness: 1,color: Colors.black.withOpacity(0.5),),
          //   //  const ListTile(leading:  Icon(Icons.location_on_outlined) ,
          //   title: Text('Shopping address'),
          //   ),
          //   Divider(thickness: 1,color: Colors.black.withOpacity(0.5),)
          // ],),
        );
  }
}