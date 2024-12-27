class UserModel {
  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVerifiedAt,
    this.timezone,
    this.phone,
    this.bio,
    this.isVerified,
    this.wallet,
    this.avatar,
    this.dob,
    this.gender,
    this.occupation,
    this.status,
    this.countryId,
    this.stateId,
    this.cityId,
    this.pincode,
    this.address,
    this.tempOtp,
    this.createdAt,
    this.updatedAt,
    this.fullName,
    this.country,
    this.state,
    this.city,
    this.verifyDocStatus,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? email;
  dynamic emailVerifiedAt;
  dynamic timezone;
  String? phone;
  String? bio;
  int? isVerified;
  dynamic wallet;
  String? avatar;
  String? dob;
  String? gender;
  dynamic occupation;
  int? status;
  int? countryId;
  int? stateId;
  int? cityId;
  dynamic pincode;
  dynamic address;
  int? tempOtp;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? fullName;
  String? country;
  String? state;
  String? city;
  String? verifyDocStatus;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"] == null ? null : json["id"],
    firstName: json["first_name"] == null ? null : json["first_name"],
    lastName: json["last_name"] == null ? null : json["last_name"],
    email: json["email"] == null ? null : json["email"],
    emailVerifiedAt: json["email_verified_at"],
    timezone: json["timezone"],
    phone: json["phone"] == null ? null : json["phone"],
    bio: json["bio"] == null ? null : json["bio"],
    isVerified: json["is_verified"] == null ? null : json["is_verified"],
    wallet: json["wallet"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    dob: json["dob"] == null ? null : json["dob"],
    gender: json["gender"] == null ? null : json["gender"],
    occupation: json["occupation"],
    status: json["status"] == null ? null : json["status"],
    countryId: json["country_id"] == null ? null : json["country_id"],
    stateId: json["state_id"] == null ? null : json["state_id"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    pincode: json["pincode"],
    address: json["address"],
    tempOtp: json["temp_otp"] == null ? null : json["temp_otp"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    fullName: json["full_name"] == null ? null : json["full_name"],
    country: json["country"] == null ? null : json["country"].toString(),
    state: json["state"] == null ? null : json["state"].toString(),
    city: json["city"] == null ? null : json["city"].toString(),
    verifyDocStatus: json["verify_doc_status"] == null ? "none" : json["verify_doc_status"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "first_name": firstName == null ? null : firstName,
    "last_name": lastName == null ? null : lastName,
    "email": email == null ? null : email,
    "email_verified_at": emailVerifiedAt,
    "timezone": timezone,
    "phone": phone == null ? null : phone,
    "bio": bio == null ? null : bio,
    "is_verified": isVerified == null ? null : isVerified,
    "wallet": wallet,
    "avatar": avatar == null ? null : avatar,
    "dob": dob == null ? null : dob,
    "gender": gender == null ? null : gender,
    "occupation": occupation,
    "status": status == null ? null : status,
    "country_id": countryId == null ? null : countryId,
    "state_id": stateId == null ? null : stateId,
    "city_id": cityId == null ? null : cityId,
    "pincode": pincode,
    "address": address,
    "temp_otp": tempOtp == null ? null : tempOtp,
    "created_at": createdAt == null ? null : createdAt?.toIso8601String(),
    "updated_at": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "full_name": fullName == null ? null : fullName,
    "country": country == null ? null : country,
    "state": state == null ? null : state,
    "city": city == null ? null : city,
    "verify_doc_status": verifyDocStatus == null ? 'none' : verifyDocStatus,
  };
}

// class City {
//   City({
//     this.id,
//     this.name,
//   });
//
//   int? id;
//   String? name;
//
//   factory City.fromJson(Map<String, dynamic> json) => City(
//     id: json["id"] == null ? null : json["id"],
//     name: json["name"] == null ? null : json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "name": name == null ? null : name,
//   };
//}
