class OrderRequestModel {
  final String orderName;
  final String buyersAddress;
  final String buyersName;
  final String phoneno;
  final String afterprice;

  OrderRequestModel({
    required this.orderName,
    required this.buyersAddress,
    required this.buyersName,
    required this.phoneno,
    required this.afterprice,
  });

  Map<String, dynamic> getJson() => {
    'orderName': orderName,
    'buyersAddress': buyersAddress,
    'buyersName': buyersName,
    'phoneno':phoneno,
    'afterprice': afterprice,
  };

  factory OrderRequestModel.getModelFromJson(
      {required Map<String, dynamic> json}) {
    return OrderRequestModel(
        orderName: json["orderName"], buyersAddress: json["buyersAddress"],buyersName:json["buyersName"],phoneno: json["phoneno"], afterprice: json['afterprice']);
  }
}