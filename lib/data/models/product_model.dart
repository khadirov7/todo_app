class ProductModel {
  ProductModel({
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.productName,
    required this.dateTime,
    required this.productId,
  });

  final String productName;
  final String description;
  final String imageUrl;
  final num price;
  final String productId;
  final DateTime dateTime;

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        description: json["description"] as String? ?? "",
        imageUrl: json["image_url"] as String? ?? "",
        price: json["price"] as num? ?? 0,
        dateTime: DateTime.fromMillisecondsSinceEpoch((json["_created"] as num).toInt() * 1000),
        productId: json["_uuid"] as String? ?? "",
        productName: json["product_name"] as String? ?? "");
  }

  Map<String,dynamic> toJson() {
    return {
          "product_name" : productName,
          "price" : price,
          "description" : description,
          "image_url" : imageUrl,
    };
  }

  Map<String,dynamic> toJsonForUpdate() {
    return {
      "product_name" : productName,
      "price" : price,
      "description" : description,
      "image_url" : imageUrl,
      "_uuid" : productId,
    };
  }

}