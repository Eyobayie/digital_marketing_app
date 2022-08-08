import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
   ReviewList({Key? key}) : super(key: key);
     TextStyle commonStyle=const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.black,
                                child: Text('A',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    )),
                              ),
                              Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Column(
                                  children:  [
                                    Text('Eyoba',style:commonStyle),
                                   const SizedBox(height: 5,),
                                    Text('His Review',style: commonStyle,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(children: [
                             Text('Date',style: commonStyle,),
                            Wrap(
                              spacing:0,
                              children: [IconButton(
                               onPressed: () {},
                               icon: const Icon(Icons.star,color: Colors.orange,size: 30.0,),
                               ),IconButton(
                               onPressed: () {},
                               icon: const Icon(Icons.star,color: Colors.orange,size: 30,),
                               ),IconButton(
                               onPressed: () {},
                               icon: const Icon(Icons.star,color: Colors.orange,size: 30,),
                               ),],
                            ),
                       ]),
                   ],
               ));
  }
}