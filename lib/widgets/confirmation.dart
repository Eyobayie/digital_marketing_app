import 'package:flutter/material.dart';

class Confirmation extends StatelessWidget {
  const Confirmation({Key? key}) : super(key: key);
  final bigStyle = const TextStyle(
      color: Color(0xff062539), fontSize: 22, fontWeight: FontWeight.bold);
   final smallStyle= const TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500);  
   final buttonTextStyle=const TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white); 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(color: Colors.black,thickness: 3,),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundColor: Color(0xff84BD3A),
                radius: 50,
                child: Icon(
                  Icons.check,
                  color: Color(0xffFF7E00),
                  size: 100,

                ),
              ),
              const SizedBox(height: 20,),
               Text('Order placed successfully',style: bigStyle,),
              const SizedBox(
                height: 10,
              ),
               Text(
                  'Congratulations! Your order has been placed. You can track your order number #303030',style: smallStyle,),
              const SizedBox(
                height: 20,
              ),
              buttonContainer('Continue shopping', Colors.orange),
              const SizedBox(
                height: 15,
              ),
              buttonContainer('Track order', const Color(0xff062539)),
            ],
          ),
        ),
      ],
    );
  }

  Widget buttonContainer(String buttonTitle, Color containerColor) {
    return Container(
      height: 40,
      width: 250,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(buttonTitle,style: buttonTextStyle,),
      ),
    );
  }
}
