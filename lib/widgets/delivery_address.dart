import 'package:flutter/material.dart';

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({Key? key}) : super(key: key);
  final bigText = const TextStyle(
    fontSize: 20, fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
    );
  final textStyle = const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
      final Color iconColor=Colors.white;
      final double iconSize=30;
      
      final unselectedAddressColor=const TextStyle(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children:[
        const Divider(color: Colors.black, thickness: 3,),
        Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SizedBox(height: 15,),
          Text(
            'Select shipping address',
            style: bigText,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.07,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(1, 1),
                    blurRadius: 1,
                    spreadRadius: 1),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                Icon(Icons.add_circle_outline,color: Colors.black,size: 30,),
                 Center(
                    child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'Add new address',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
            color: const Color(0xff7AB13A),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const SizedBox(height:10),
            Row(
           children: [
              Icon(Icons.home_outlined,color: iconColor,),
             const SizedBox(
               width: 15,
             ),
             Text(
               'Home',
               style: textStyle,
             ),
             const Spacer(),
              Icon(Icons.check_circle_outline,color: iconColor,),
             // Icon(Icons.check_circle_rounded),

             //Icon(Icons.check_box_outlined)
           ],
            ),
            const SizedBox(height: 10,),
            Text(
           'Dean Handerson',
           style: textStyle,
            ),
           const SizedBox(height: 10,),
            Text(
           '+251991019921',
           style: textStyle,
            ),
            const SizedBox(height: 10,),
            Text(
           'Addis ababa arat kolo: Ethiopia',
           style: textStyle,
            ),
            const SizedBox(height: 10,),

          ]),
          ),
          const SizedBox(
          height: 10,
          ),
         Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
            color:  Colors.white,
           border: Border.all(
                 color: Colors.black.withOpacity(0.3),
                 width: 3,
               ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           const SizedBox(height:10),
            Row(
           children: [
             const Icon(Icons.home_outlined,color: Colors.black,),
             const SizedBox(
               width: 15,
             ),
             Text(
               'Home',
               style: unselectedAddressColor,
             ),
             const Spacer(),
            const Icon(Icons.circle_outlined,color: Colors.black,),
             // Icon(Icons.check_circle_rounded),

             //Icon(Icons.check_box_outlined)
           ],
            ),
            const SizedBox(height: 10,),
            Text(
           'Dean Handerson',
           style: unselectedAddressColor,
            ),
           const SizedBox(height: 10,),
            Text(
           '+251991019921',
           style: unselectedAddressColor,
            ),
            const SizedBox(height: 10,),
            Text(
           'Addis ababa arat kolo: Ethiopia',
           style: unselectedAddressColor,
            ),
            const SizedBox(height: 10,),

          ]),
          ),
          const SizedBox(height: 10,),
          Center(
            child: Container(
              width: 180,
              height: 40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(1, 1),
                      blurRadius: 1,
                      spreadRadius: 1),
                ],
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Next',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                ),
              )),
            ),
          ),
        ]),
      ),],
       
    );
  }
}
