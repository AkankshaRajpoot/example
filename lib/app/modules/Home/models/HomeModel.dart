class HomeModel {
  HomeModel({
    this.hotelNearYou,
    this.dailyDeal,
    this.recentSearch,
  });

  List<HotelNearYou>? hotelNearYou;
  List<DailyDealModel>? dailyDeal;
  List<RecentSearchModel>? recentSearch;

  HomeModel copyWith({
    List<HotelNearYou>? hotelNearYou,
    List<DailyDealModel>? dailyDeal,
    List<RecentSearchModel>? recentSearch,
  }) =>
      HomeModel(
        hotelNearYou: hotelNearYou ?? this.hotelNearYou,
        dailyDeal: dailyDeal ?? this.dailyDeal,
        recentSearch: recentSearch ?? this.recentSearch,
      );

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    hotelNearYou: json["hotelNearYou"] == null ? [] : List<HotelNearYou>.from(json["hotelNearYou"]!.map((x) => HotelNearYou.fromJson(x))),
    dailyDeal: json["dailyDeals"] == null ? [] : List<DailyDealModel>.from(json["dailyDeals"]!.map((x) => DailyDealModel.fromJson(x))),
    recentSearch: json["recentSearch"] == null ? [] : List<RecentSearchModel>.from(json["recentSearch"]!.map((x) => RecentSearchModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hotelNearYou": hotelNearYou == null ? [] : List<dynamic>.from(hotelNearYou!.map((x) => x.toJson())),
    "dailyDeal": dailyDeal == null ? [] : List<dynamic>.from(dailyDeal!.map((x) => x.toJson())),
    "recentSearch": recentSearch == null ? [] : List<dynamic>.from(recentSearch!.map((x) => x.toJson())),
  };
}

class HotelNearYou {
  HotelNearYou({
    this.hotelName,
    this.hotelLocation,
    this.price,
  });

  String? hotelName;
  String? hotelLocation;
  String? price;

  HotelNearYou copyWith({
    String? hotelName,
    String? hotelLocation,
    String? price,
  }) =>
      HotelNearYou(
        hotelName: hotelName ?? this.hotelName,
        hotelLocation: hotelLocation ?? this.hotelLocation,
        price: price ?? this.price,
      );

  factory HotelNearYou.fromJson(Map<String, dynamic> json) => HotelNearYou(
    hotelName: json["HotelName"],
    hotelLocation: json["HotelLocation"],
    price: json["Price"],
  );

  Map<String, dynamic> toJson() => {
    "HotelName": hotelName,
    "HotelLocation": hotelLocation,
    "Price": price,
  };
}

class DailyDealModel {
  DailyDealModel({
    this.hotelName,
    this.hotelLocation,
    this.hotelReviews,
    this.discount,
    this.price,
    this.tax,
  });

  String? hotelName;
  String? hotelLocation;
  String? hotelReviews;
  String? discount;
  String? price;
  String? tax;

  DailyDealModel copyWith({
    String? hotelName,
    String? hotelLocation,
    String? hotelReviews,
    String? discount,
    String? price,
    String? tax,
  }) =>
      DailyDealModel(
        hotelName: hotelName ?? this.hotelName,
        hotelLocation: hotelLocation ?? this.hotelLocation,
        hotelReviews: hotelReviews ?? this.hotelReviews,
        discount: discount ?? this.discount,
        price: price ?? this.price,
        tax: tax ?? this.tax,
      );

  factory DailyDealModel.fromJson(Map<String, dynamic> json) => DailyDealModel(
    hotelName: json["hotelName"],
    hotelLocation: json["hotelLocation"],
    hotelReviews: json["hotelReviews"],
    discount: json["discount"],
    price: json["price"],
    tax: json["tax"],
  );

  Map<String, dynamic> toJson() => {
    "hotelName": hotelName,
    "hotelLocation": hotelLocation,
    "hotelReviews": hotelReviews,
    "discount": discount,
    "price": price,
    "tax": tax,
  };
}
class RecentSearchModel {
  RecentSearchModel({
    this.district,
    this.country,
    this.people,
    this.duration,
  });

  String? district;
  String? country;
  String? people;
  String? duration;

  RecentSearchModel copyWith({
    String? district,
    String? country,
    String? people,
    String? duration,
  }) =>
      RecentSearchModel(
        district: district ?? this.district,
        country: country ?? this.country,
        people: people ?? this.people,
        duration: duration ?? this.duration,
      );

  factory RecentSearchModel.fromJson(Map<String, dynamic> json) => RecentSearchModel(
    district: json["district"],
    country: json["country"],
    people: json["people"],
    duration: json["duration"],
  );

  Map<String, dynamic> toJson() => {
    "district": district,
    "country": country,
    "people": people,
    "duration": duration,
  };
}

