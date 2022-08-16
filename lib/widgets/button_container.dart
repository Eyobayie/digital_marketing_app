import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({Key? key, required this.color, required this.title}) : super(key: key);
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
     return Container(
      margin:const EdgeInsets.symmetric(horizontal: 10),
      height: MediaQuery.of(context).size.height * 0.06,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child:  Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          title,
          style:const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
        ),
      )),
    );
  }
}