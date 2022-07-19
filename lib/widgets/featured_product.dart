
import 'package:flutter/material.dart';
class FeaturedProduct extends StatelessWidget {
   const FeaturedProduct({ Key? key }) : super(key: key);
  final TextStyle textStyle=const TextStyle(fontSize:16);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:MediaQuery.of(context).size.height*0.22,
      width: double.infinity,
      child: Column( children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                Text('Featured Products',style: textStyle,),
                Text('View all',style:textStyle.copyWith(color: Colors.orange)),
              ]
              ),
              Row(
                children: [
                  Container(
                  height: MediaQuery.of(context).size.height*0.19,
                  width: MediaQuery.of(context).size.width*0.5,
                  child: const Card(
                    elevation: 10,
                    color: Colors.white,
                    child:  Padding(
                      padding: EdgeInsets.symmetric(horizontal:5,vertical: 5),
                      child: Image(
                        image: AssetImage('assets/images/solar panel3.jpg'),
                        fit: BoxFit.cover,
                        ),
                    ),
                    ),
                  ),
                  Container(
                  height: MediaQuery.of(context).size.height*0.19,
                  width: MediaQuery.of(context).size.width*0.5,
                  child: const Card(
                    elevation: 10,
                    color: Colors.white,
                    child:  Padding(
                     padding: EdgeInsets.symmetric(horizontal:5,vertical: 5),
                      child: Image(
                        image: AssetImage('assets/images/solar panel2.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                   ),
                  ),
                ],
              )
           ]  
      ),
    );
  }
}