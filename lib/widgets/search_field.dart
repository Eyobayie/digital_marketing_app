
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
   double width;
   Color color;
   double containerHeight;
   double textFieldHeight;
  SearchField(
      {Key? key,
       this.color=const  Color(0xff062539),
       this.width=400,
       this.containerHeight=70.0,
       this.textFieldHeight=60,
       })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: containerHeight,
      //MediaQuery.of(context).size.height*0.11,
      color: color,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: SizedBox(
            height: textFieldHeight,
            child: TextField(
              autofocus: false,
              cursorHeight: 25,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.search,
              maxLines: 1,
              onChanged: (value) => {},
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                suffixIconColor: const Color.fromARGB(255, 8, 6, 6),
                hintText: 'Search for solar products...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
