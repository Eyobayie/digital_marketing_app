class DeliveryAddress{
  List<Address> addresses;
  DeliveryAddress({required this.addresses});
 
 factory DeliveryAddress.fromJson(List<dynamic> wholeAddress){
    List<Address> addressList=wholeAddress.map((address)=>Address.fromJson(address)).toList();
      return DeliveryAddress(addresses: addressList);
 }
}

class Address{
  int id;
  String phoneNumber;
  String userRegion;
  String userZone;
  String userWoreda;
  Address({
    required this.id,
    required this.phoneNumber,
    required this.userRegion,
    required this.userWoreda, 
    required this.userZone});

    factory Address.fromJson(Map<String,dynamic> jsonData){
      return Address(
        id: jsonData['id'], 
        phoneNumber: jsonData['phone_number'], 
        userRegion: jsonData['user_region'], 
        userWoreda: jsonData['user_woreda'], 
        userZone: jsonData['user_zone']
        );
    }
}