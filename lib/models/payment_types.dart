class PaymentTypeList{
  List<PaymentType> paymentList;
  PaymentTypeList({required this.paymentList});
  factory PaymentTypeList.fromJson(List<dynamic> payments){
    List<PaymentType> paymentTypes=payments.map((paymentType) => PaymentType.fromJson(paymentType)).toList();
    return PaymentTypeList(paymentList: paymentTypes);
  }
}

class PaymentType{
  int id;
  String paymentName;
  String paymentDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  
  PaymentType({
    required this.id,
    required this.paymentName,
    required this.paymentDescription,
    this.createdAt,
    this.updatedAt,
    });
    factory PaymentType.fromJson(Map<String,dynamic> jsonData){
      return PaymentType(
        id: jsonData['id'], 
        paymentName: jsonData['payment_name'], 
        paymentDescription: jsonData['payment_description'],
        createdAt: jsonData['created_at'],     
        updatedAt: jsonData['updated_at'],   
        ); 
    }
}