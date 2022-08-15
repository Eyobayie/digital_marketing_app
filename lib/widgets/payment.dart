
import 'package:flutter/material.dart';

class PaymentWidget extends StatefulWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  State<PaymentWidget> createState() => _PaymentWidgetState();
}

class _PaymentWidgetState extends State<PaymentWidget> {
    String dropdownValue = 'One';
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

        children: [
           ExpansionTile(
            title:  Text('Items',style: textStyle,),
            children: [
                ListView.builder(
                 shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context,index)=>
                   ListTile(
                      leading: Image.asset('assets/images/shop1.jpg'),
                      title:  Text('solar panel',style:textStyle),
                      subtitle:  Text('2',style: textStyle,),
                      trailing:  Text('2000 ETB',style: textStyle,),
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
        onChanged: (newValue) {
          setState(() {
            dropdownValue=newValue.toString();
          });
        },
        items: <String>['One', 'Two', 'Three', 'Four']
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
           Container(
            width: 200,
            height: 40,
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
            child: const Center(
              child: Text('PERCHASE ORDER-3000 ETB',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),),
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