import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(1, 1),
                      blurRadius: 1,
                      spreadRadius: 1),
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                Text('Shopping price'),
                Text('Free'),
              ],),
        ),
              const SizedBox(height: 1,),
                Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(1, 1),
                      blurRadius: 1,
                      spreadRadius: 1),
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                Text('Shopping price'),
                Text('Free'),
              ],),
        ),
         const SizedBox(height: 1,),
                Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(1, 1),
                      blurRadius: 1,
                      spreadRadius: 1),
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                Text('Shopping price'),
                Text('Free'),
              ],),
        ),
          const SizedBox(height: 1,),
                Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      offset: const Offset(1, 1),
                      blurRadius: 1,
                      spreadRadius: 1),
                ],
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                Text('Shopping price'),
                Text('Free'),
              ],),
        ), 
         const SizedBox(height: 1,),
                Container(
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
                children: const [
                Text('Shopping price'),
                Text('Free'),
              ],),
        ),
      ],
    );
  }
}