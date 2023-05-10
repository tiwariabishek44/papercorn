class ProductModel {
  final String url;
  final String productName;
  final double cost;
  final double gcash;
  final double aftercash;
  final int discount;
  final String uid;
  final String sellerName;
  final String sellerUid;
  final int rating;
  final int noOfRating;

  ProductModel({
    required this.url,
    required this.productName,
    required this.cost,
    required this.gcash,
    required this.aftercash,
    required this.discount,
    required this.uid,
    required this.sellerName,
    required this.sellerUid,
    required this.rating,
    required this.noOfRating,
  });

  Map<String, dynamic> getJson() {
    return {
      'url': url,
      'productName': productName,
      'cost': cost,
      'G-cash': gcash,
      'aftercash' :aftercash,
      'discount': discount,
      'uid': uid,
      'sellerName': sellerName,
      'sellerUid': sellerUid,
      'rating': rating,
      'noOfRating': noOfRating,
    };
  }

  factory ProductModel.getModelFromJson({required Map<String, dynamic> json}) {
    return ProductModel(
        url: json["url"],
        productName: json["productName"],
        cost: json["cost"],
        gcash: json["G-cash"],
        aftercash: json['aftercash'],

        discount: json["discount"],
        uid: json["uid"],
        sellerName: json["sellerName"],
        sellerUid: json["sellerUid"],
        rating: json["rating"],
        noOfRating: json["noOfRating"]);
  }
}