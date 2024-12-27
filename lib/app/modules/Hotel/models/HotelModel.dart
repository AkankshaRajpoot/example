class HotelModel {
  HotelModel({
    this.reviews,
    this.ratings,
    this.hotelName,
    this.price,
    this.discountprice,
    this.tax,
    this.detail,
    this.location,
  });

  String? reviews;
  String? ratings;
  String? hotelName;
  String? price;
  String? discountprice;
  String? tax;
  String? detail;
  String? location;

  HotelModel copyWith({
    String? reviews,
    String? ratings,
    String? hotelName,
    String? price,
    String? discountprice,
    String? tax,
    String? detail,
    String? location,
  }) =>
      HotelModel(
        reviews: reviews ?? this.reviews,
        ratings: ratings ?? this.ratings,
        hotelName: hotelName ?? this.hotelName,
        price: price ?? this.price,
        discountprice: discountprice ?? this.discountprice,
        tax: tax ?? this.tax,
        detail: detail ?? this.detail,
        location: location ?? this.location,
      );

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        reviews: json["reviews"],
        ratings: json["ratings"],
        hotelName: json["hotelName"],
        price: json["price"],
        discountprice: json["discountprice"],
        tax: json["tax"],
        detail: json["detail"],
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "reviews": reviews,
        "ratings": ratings,
        "hotelName": hotelName,
        "price": price,
        "discountprice": discountprice,
        "tax": tax,
        "detail": detail,
        "location": location,
      };
}

/// HotelShow
class HotelShowModel {
  HotelShowModel({
    this.overView,
    this.hotelImage,
  });

  OverView? overView;
  List<HotelImage>? hotelImage;

  HotelShowModel copyWith({
    OverView? overView,
    List<HotelImage>? hotelImage,
  }) =>
      HotelShowModel(
        overView: overView ?? this.overView,
        hotelImage: hotelImage ?? this.hotelImage,
      );

  factory HotelShowModel.fromJson(Map<String, dynamic> json) => HotelShowModel(
        overView: json["overView"] == null
            ? null
            : OverView.fromJson(json["overView"]),
        hotelImage: json["hotel_image"] == null
            ? []
            : List<HotelImage>.from(
                json["hotel_image"]!.map((x) => HotelImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "overView": overView?.toJson(),
        "hotel_image": hotelImage == null
            ? []
            : List<dynamic>.from(hotelImage!.map((x) => x.toJson())),
      };
}

class HotelImage {
  HotelImage({
    this.image,
  });

  String? image;

  HotelImage copyWith({
    String? image,
  }) =>
      HotelImage(
        image: image ?? this.image,
      );

  factory HotelImage.fromJson(Map<String, dynamic> json) => HotelImage(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}
class OverView {
  OverView({
    this.hotelName,
    this.rules,
    this.offers,
    this.checkIn,
    this.checkOut,
    this.similar,
  });

  String? hotelName;
  List<Rule>? rules;
  String? offers;
  String? checkIn;
  String? checkOut;
  List<Similar>? similar;

  OverView copyWith({
    String? hotelName,
    List<Rule>? rules,
    String? offers,
    String? checkIn,
    String? checkOut,
    List<Similar>? similar,
  }) =>
      OverView(
        hotelName: hotelName ?? this.hotelName,
        rules: rules ?? this.rules,
        offers: offers ?? this.offers,
        checkIn: checkIn ?? this.checkIn,
        checkOut: checkOut ?? this.checkOut,
        similar: similar ?? this.similar,
      );

  factory OverView.fromJson(Map<String, dynamic> json) => OverView(
    hotelName: json["hotelName"],
    rules: json["rules"] == null ? [] : List<Rule>.from(json["rules"]!.map((x) => Rule.fromJson(x))),
    offers: json["offers"],
    checkIn: json["checkIn"],
    checkOut: json["checkOut"],
    similar: json["similar"] == null ? [] : List<Similar>.from(json["similar"]!.map((x) => Similar.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "hotelName": hotelName,
    "rules": rules == null ? [] : List<dynamic>.from(rules!.map((x) => x.toJson())),
    "offers": offers,
    "checkIn": checkIn,
    "checkOut": checkOut,
    "similar": similar == null ? [] : List<dynamic>.from(similar!.map((x) => x.toJson())),
  };
}

class Rule {
  Rule({
    this.hotelRules,
  });

  String? hotelRules;

  Rule copyWith({
    String? hotelRules,
  }) =>
      Rule(
        hotelRules: hotelRules ?? this.hotelRules,
      );

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
    hotelRules: json["hotel_rules"],
  );

  Map<String, dynamic> toJson() => {
    "hotel_rules": hotelRules,
  };
}

class Similar {
  Similar({
    this.hotelName,
    this.hotelLocation,
    this.cancellation,
    this.price,
    this.discount,
    this.tax,
    this.details,
  });

  String? hotelName;
  String? hotelLocation;
  String? cancellation;
  String? price;
  String? discount;
  String? tax;
  String? details;

  Similar copyWith({
    String? hotelName,
    String? hotelLocation,
    String? cancellation,
    String? price,
    String? discount,
    String? tax,
    String? details,
  }) =>
      Similar(
        hotelName: hotelName ?? this.hotelName,
        hotelLocation: hotelLocation ?? this.hotelLocation,
        cancellation: cancellation ?? this.cancellation,
        price: price ?? this.price,
        discount: discount ?? this.discount,
        tax: tax ?? this.tax,
        details: details ?? this.details,
      );

  factory Similar.fromJson(Map<String, dynamic> json) => Similar(
    hotelName: json["hotelName"],
    hotelLocation: json["hotelLocation"],
    cancellation: json["cancellation"],
    price: json["price"],
    discount: json["discount"],
    tax: json["tax"],
    details: json["details"],
  );

  Map<String, dynamic> toJson() => {
    "hotelName": hotelName,
    "hotelLocation": hotelLocation,
    "cancellation": cancellation,
    "price": price,
    "discount": discount,
    "tax": tax,
    "details": details,
  };
}


///Amenities
class AmenitiesModel {
  AmenitiesModel({
    this.amenities,
    this.services,
    this.general,
    this.room,
    this.other,
  });

  List<Amenity>? amenities;
  List<General>? services;
  List<General>? general;
  List<General>? room;
  List<General>? other;

  AmenitiesModel copyWith({
    List<Amenity>? amenities,
    List<General>? services,
    List<General>? general,
    List<General>? room,
    List<General>? other,
  }) =>
      AmenitiesModel(
        amenities: amenities ?? this.amenities,
        services: services ?? this.services,
        general: general ?? this.general,
        room: room ?? this.room,
        other: other ?? this.other,
      );

  factory AmenitiesModel.fromJson(Map<String, dynamic> json) => AmenitiesModel(
    amenities: json["amenities"] == null ? [] : List<Amenity>.from(json["amenities"]!.map((x) => Amenity.fromJson(x))),
    services: json["services"] == null ? [] : List<General>.from(json["services"]!.map((x) => General.fromJson(x))),
    general: json["general"] == null ? [] : List<General>.from(json["general"]!.map((x) => General.fromJson(x))),
    room: json["room"] == null ? [] : List<General>.from(json["room"]!.map((x) => General.fromJson(x))),
    other: json["other"] == null ? [] : List<General>.from(json["other"]!.map((x) => General.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "amenities": amenities == null ? [] : List<dynamic>.from(amenities!.map((x) => x.toJson())),
    "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
    "general": general == null ? [] : List<dynamic>.from(general!.map((x) => x.toJson())),
    "room": room == null ? [] : List<dynamic>.from(room!.map((x) => x.toJson())),
    "other": other == null ? [] : List<dynamic>.from(other!.map((x) => x.toJson())),
  };
}

class Amenity {
  Amenity({
    this.image,
    this.service,
    this.review,
  });

  String? image;
  String? service;
  String? review;

  Amenity copyWith({
    String? image,
    String? service,
    String? review,
  }) =>
      Amenity(
        image: image ?? this.image,
        service: service ?? this.service,
        review: review ?? this.review,
      );

  factory Amenity.fromJson(Map<String, dynamic> json) => Amenity(
    image: json["image"],
    service: json["service"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "image": image,
    "service": service,
    "review": review,
  };
}

class General {
  General({
    this.title,
  });

  String? title;

  General copyWith({
    String? title,
  }) =>
      General(
        title: title ?? this.title,
      );

  factory General.fromJson(Map<String, dynamic> json) => General(
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
  };
}
