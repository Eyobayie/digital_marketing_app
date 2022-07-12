import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      height:MediaQuery.of(context).size.height*0.11,
      color:const Color.fromARGB(255, 7, 42, 70),
      child: Center(
        child: Padding(
          padding:const EdgeInsets.symmetric(horizontal:6),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
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
              decoration:  InputDecoration(
                  suffixIcon:  const Icon(Icons.search),
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
