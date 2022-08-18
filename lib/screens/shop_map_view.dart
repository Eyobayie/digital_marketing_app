import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../util/shop_locations.dart';

class ShopMapView extends StatefulWidget {
  const ShopMapView({Key? key}) : super(key: key);
  @override
  State<ShopMapView> createState() => _ShopMapViewState();
}

class _ShopMapViewState extends State<ShopMapView> {
  Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(37.361353, 11.574209),
    zoom: 12,
  );

  final Set<Marker> _markers = {};
  List<Shop> shopList = [];
  fetchShopCoordinates() async {
    ShopController cooCtrl = ShopController();
    shopList = await cooCtrl.fetchShops();
    print('🤞shop list 😂');
    print(shopList);
  }

  BitmapDescriptor customIcon =
      BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet);

  @override
  void initState() {
    super.initState();
    fetchShopCoordinates();
  }

// void _onMapCreated (GoogleMapController controller) {
//   setState(() {
//     _markers.add(
//       const Marker(
//         markerId: MarkerId("id-1"),
//         position: LatLng(37.42796133580664, -122.085749655962)
//       )
//     );
//   });
// }

  void _onMapCreated(GoogleMapController controller) {
    // make sure to initialize before map loading

    setState(() {
      _markers.addAll(shopList
          .map((Shop e) => Marker(
              markerId: MarkerId(e.id.toString()),
              position: LatLng(double.parse(e.lat), double.parse(e.lng)),
              icon: customIcon,
              infoWindow: InfoWindow(
                title: e.shopName,
              )))
          .toList());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Location"),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: _onMapCreated,
        mapToolbarEnabled: true,
        buildingsEnabled: false,
        myLocationButtonEnabled: true,
        markers: _markers,
        zoomControlsEnabled: true,
      ),
    );
  }
}
