import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class ImageSliders extends StatelessWidget {
   ImageSliders({ Key? key }) : super(key: key);
     final _controller=PageController();
  @override
  Widget build(BuildContext context) {
   List<Widget> imageList=[
imageContainer('assets/images/home1.jpg'),
imageContainer('assets/images/home2.jpg'),
imageContainer('assets/images/home3.jpg'),
imageContainer('assets/images/home4.jpg'),
  ];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height:MediaQuery.of(context).size.height*0.15,
          child: PageView.builder(
          controller: _controller,
          itemCount: imageList.length,
          itemBuilder: (context, index)=>imageList[index],
        )),
        const SizedBox(height:5),
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
    ),]);
  }
  Widget imageContainer(String assetName){
    return  Container(
  height: 150,
  width: double.infinity,
  decoration:  BoxDecoration(
    borderRadius:BorderRadius.circular(10),
  ),
    child:Image.asset(assetName,
    fit: BoxFit.cover,
    width:double.infinity,
    ),
   );
  }
}