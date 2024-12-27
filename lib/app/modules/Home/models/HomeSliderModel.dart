class HomeSliderModel {
  HomeSliderModel({
    this.id,
    this.title,
    this.status,
    this.sliderTypeId,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.image,
    this.hotelName,
    this.hotelLocation,
    this.price,
  });

  int? id;
  String? title;
  int? status;
  int? sliderTypeId;
  dynamic description;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  String? image;
  String? hotelName;
  String? hotelLocation;
  String? price;

  factory HomeSliderModel.fromJson(Map<String, dynamic> json) => HomeSliderModel(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        status: json["status"] == null ? null : json["status"],
        sliderTypeId: json["slider_type_id"] == null ? null : json["slider_type_id"],
        description: json["description"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        image: json["image"] == null ? null : json["image"],
        hotelName: json["hotelName"] == null ? null : json["hotelName"],
        hotelLocation: json["hotelLocation"] == null ? null : json["hotelLocation"],
        price: json["price"] == null ? null : json["price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "status": status == null ? null : status,
        "slider_type_id": sliderTypeId == null ? null : sliderTypeId,
        "description": description,
        "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "image": image == null ? null : image,
        "hotelName": hotelName == null ? null : hotelName,
        "hotelLocation": hotelLocation == null ? null : hotelLocation,
        "price": price == null ? null : price,
      };
}
