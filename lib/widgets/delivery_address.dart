import 'package:flutter/material.dart';
import 'package:rynsysengineering/models/address.dart';
import 'package:rynsysengineering/util/address_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeliveryAddressWidget extends StatefulWidget {
  DeliveryAddressWidget({Key? key}) : super(key: key);

  @override
  State<DeliveryAddressWidget> createState() => _DeliveryAddressWidgetState();
}

class _DeliveryAddressWidgetState extends State<DeliveryAddressWidget> {
  final bigText = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
  );

  final textStyle = const TextStyle(
      color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);

  final Color iconColor = Colors.white;

  final double iconSize = 30;

  final unselectedAddressColor = const TextStyle(
      color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500);

//   getToken() async{
//    SharedPreferences preferences = await SharedPreferences.getInstance();
//     token = preferences.getString('access_token');
//  }
  // @override
  // void initState() async {
  //  token;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final isToken=ModalRoute.of(context)!.settings.arguments;
    return 
         FutureBuilder<DeliveryAddress>(
            future: DeliveryAddressService().fetchAddress(),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    const Divider(
                      color: Colors.black,
                      thickness: 3,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
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
                        children: const [
                          Icon(
                            Icons.add_circle_outline,
                            color: Colors.black,
                            size: 30,
                          ),
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
                    Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.addresses.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            userDeliveryInfo(
                              Icons.home_outlined,
                              'Home',
                              Icons.circle_outlined,
                              snapshot.data!.addresses[index].userRegion,
                              snapshot.data!.addresses[index].userZone,
                              snapshot.data!.addresses[index].userWoreda,
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }),
          );
        
    //:Container()
  }

  Widget userDeliveryInfo(IconData icon, String where, IconData? checkIcon,
      String userName, String phoneNumber, String specificLocation) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black.withOpacity(0.3),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Icon(
              icon,
              color: Colors.black,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              where,
              style: unselectedAddressColor,
            ),
            const Spacer(),
            Icon(
              checkIcon,
              color: Colors.black,
            ),
            //Icons.circle_outlined
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          userName,
          // 'Dean Handerson',
          style: unselectedAddressColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          phoneNumber,
          //'+251991019921',
          style: unselectedAddressColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          specificLocation,
          //'Addis ababa arat kolo: Ethiopia',
          style: unselectedAddressColor,
        ),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }

  // Future<bool> isTokenExist() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   token = preferences.getString('access_token');
  //   if (token != null) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
