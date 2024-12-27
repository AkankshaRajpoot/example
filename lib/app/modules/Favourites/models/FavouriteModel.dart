class FavouriteModel {
  FavouriteModel({
    this.hotelName,
    this.location,
    this.discountPercent,
    this.price,
    this.discountPrice,
    this.tax,
    this.duration,
    this.detail,
  });

  String? hotelName;
  String? location;
  String? discountPercent;
  String? price;
  String? discountPrice;
  String? tax;
  String? duration;
  String? detail;

  FavouriteModel copyWith({
    String? hotelName,
    String? location,
    String? discountPercent,
    String? price,
    String? discountPrice,
    String? tax,
    String? duration,
    String? detail,
  }) =>
      FavouriteModel(
        hotelName: hotelName ?? this.hotelName,
        location: location ?? this.location,
        discountPercent: discountPercent ?? this.discountPercent,
        price: price ?? this.price,
        discountPrice: discountPrice ?? this.discountPrice,
        tax: tax ?? this.tax,
        duration: duration ?? this.duration,
        detail: detail ?? this.detail,
      );

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
    hotelName: json["hotelName"],
    location: json["location"],
    discountPercent: json["discountPercent"],
    price: json["price"],
    discountPrice: json["discountPrice"],
    tax: json["tax"],
    duration: json["duration"],
    detail: json["detail"],
  );

  Map<String, dynamic> toJson() => {
    "hotelName": hotelName,
    "location": location,
    "discountPercent": discountPercent,
    "price": price,
    "discountPrice": discountPrice,
    "tax": tax,
    "duration": duration,
    "detail": detail,
  };
}
