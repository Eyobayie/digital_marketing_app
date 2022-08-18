import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rynsysengineering/util/product_detail_service.dart';
import 'package:rynsysengineering/widgets/product/tabs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../providers/product/productdetailprovider.dart';

class Common extends StatelessWidget {
   Common({ Key? key }) : super(key: key);
   final _controller=PageController();
  // final List<Widget> imageList= [
  // Image.asset('assets/images/solar panel1.jpg',fit: BoxFit.cover),
  // Image.asset('assets/images/solar panel2.jpg',fit: BoxFit.cover),
  // Image.asset('assets/images/solar panel3.jpg',fit: BoxFit.cover),
  // ]
  
  final iconSize=30.0;
  final iconColor=Colors.orange;

  @override
  Widget build(BuildContext context) {
    final double separetorHeight=MediaQuery.of(context).size.height*0.03;
    final productId=ModalRoute.of(context)!.settings.arguments as int;
    return FutureBuilder<ProductDetail>(
      future: ProductDetailService().fetchProductDetail(productId),
      builder: (context,snapshot){
        if(snapshot.hasData){
          return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height:MediaQuery.of(context).size.height*0.2,
            child: PageView.builder(
            controller: _controller,
            itemCount: snapshot.data!.allPhotos.imageList!.length,
            itemBuilder: (context, index)=>Image.network(snapshot.data!.allPhotos.imageList![index].path),
          )),
          const SizedBox(height:10),
          SmoothPageIndicator(
            controller: _controller,
             count: snapshot.data!.allPhotos.imageList!.length,
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
           SizedBox(height: separetorHeight,),
          Text(snapshot.data!.price.toString() +' ETB',
             style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
             ),
          const SizedBox(height: 5,),
           Text(snapshot.data!.description,
          style: const TextStyle(fontSize: 20,
          ),),
         const SizedBox(height: 10,),
           Divider(color: Colors.black.withOpacity(0.7), thickness: 1),
           ProductTabs( productDetail: snapshot.data),
               ],
            );
          }
        else if(snapshot.hasError){
          return const Text('There is some error');
        }
        return const Center(child:  CircularProgressIndicator());
      },
    );
  }
}