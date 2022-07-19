import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rynsysengineering/widgets/product/tabs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Common extends StatelessWidget {
   Common({ Key? key }) : super(key: key);
   final _controller=PageController();
  final List<Widget> imageList= [
  Image.asset('assets/images/solar panel1.png',fit: BoxFit.cover),
  Image.asset('assets/images/solar panel2.jpg',fit: BoxFit.cover),
  Image.asset('assets/images/solar panel3.jpg',fit: BoxFit.cover),
  ];
  final iconSize=30.0;
  final iconColor=Colors.orange;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height:MediaQuery.of(context).size.height*0.25,
          child: PageView.builder(
          controller: _controller,
          itemCount: imageList.length,
          itemBuilder: (context, index)=>imageList[index],
        )),
        SmoothPageIndicator(
          controller: _controller,
           count: imageList.length,
           effect:  const ScrollingDotsEffect(
            activeDotColor: Colors.orange,
            dotColor: Colors.grey,
            spacing: 10,
            dotHeight: 15,
            dotWidth: 15,
            ),
            // onDotClicked: (index){
            // },
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
           const Text('2000 ' +' ETB',
           style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
           ),
           Wrap(
            spacing: 5,   
             children: [
               Icon(Icons.star,color: iconColor,size: iconSize,),
               Icon(Icons.star,color: iconColor,size: iconSize),
               Icon(Icons.star,color: iconColor,size: iconSize),
               Icon(Icons.star,color: iconColor,size: iconSize),
               Icon(Icons.star,size: iconSize,),
               const Text('4.5')
             ],
           ),
        ],),
        const Text('There is some description about the product that you have seen above',
        style: TextStyle(fontSize: 18,
        fontWeight: FontWeight.w600,
        ),),
        const Divider(color: Colors.red,height: 10,),
       const ProductTabs(),
      ],
    );
    // return Column(
    //   children: [
    //     CarouselSlider(
    //       items: imageList,
    //       options:  CarouselOptions(
    //                 height: MediaQuery.of(context).size.height*0.25,
    //                 enlargeCenterPage: true,
    //                 autoPlay: true,
    //                 aspectRatio: 16 / 9,
    //                 enableInfiniteScroll: true,
    //                 autoPlayAnimationDuration: const Duration(milliseconds: 800),
    //                 viewportFraction: 0.8,
    //                 // onPageChanged: (value){
                      
    //                 // }
                    
    //               ),
              
    //         ),
    //         SmoothPageIndicator(
    //           controller: _controller, 
    //           count: imageList.length),
    //   ],
    // );
  }
}