/// createdby Daewu Bintara
/// Friday, 1/22/21

import 'dart:convert';

class Member {
  Member({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.provinceId,
    this.cityId,
    this.districtId,
    this.subdistrictId,
    this.postalCode,
    this.status,
    this.verified,
    this.verifiedAt,
    this.fbId,
    this.appleId,
    this.image,
    this.deviceName,
    this.deviceId,
    this.deviceOs,
    this.latitude,
    this.longitude,
    this.referalId,
    this.referalCode,
    this.mitra,
    this.apiToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.imageLink,
    this.greetingName,
  });

  int id;
  String name;
  String email;
  String phone;
  String address;
  int provinceId;
  int cityId;
  int districtId;
  int subdistrictId;
  String postalCode;
  String status;
  int verified;
  String verifiedAt;
  var fbId;
  var appleId;
  String image;
  String deviceName;
  String deviceId;
  String deviceOs;
  double latitude;
  double longitude;
  var referalId;
  String referalCode;
  int mitra;
  var apiToken;
  String createdAt;
  String updatedAt;
  var deletedAt;
  String imageLink;
  String greetingName;

  factory Member.fromJson(String str) => Member.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Member.fromMap(Map<String, dynamic> json) => Member(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    address: json["address"] == null ? null : json["address"],
    provinceId: json["province_id"] == null ? null : json["province_id"],
    cityId: json["city_id"] == null ? null : json["city_id"],
    districtId: json["district_id"] == null ? null : json["district_id"],
    subdistrictId: json["subdistrict_id"] == null ? null : json["subdistrict_id"],
    postalCode: json["postal_code"] == null ? null : json["postal_code"],
    status: json["status"] == null ? null : json["status"],
    verified: json["verified"] == null ? null : json["verified"],
    verifiedAt: json["verified_at"] == null ? null : json["verified_at"],
    fbId: json["fb_id"],
    appleId: json["apple_id"],
    image: json["image"] == null ? null : json["image"],
    deviceName: json["device_name"] == null ? null : json["device_name"],
    deviceId: json["device_id"] == null ? null : json["device_id"],
    deviceOs: json["device_os"] == null ? null : json["device_os"],
    latitude: json["latitude"] == null ? null : json["latitude"].toDouble(),
    longitude: json["longitude"] == null ? null : json["longitude"].toDouble(),
    referalId: json["referal_id"],
    referalCode: json["referal_code"] == null ? null : json["referal_code"],
    mitra: json["mitra"] == null ? null : json["mitra"],
    apiToken: json["api_token"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
    deletedAt: json["deleted_at"],
    imageLink: json["image_link"] == null ? null : json["image_link"],
    greetingName: json["greeting_name"] == null ? null : json["greeting_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "address": address == null ? null : address,
    "province_id": provinceId == null ? null : provinceId,
    "city_id": cityId == null ? null : cityId,
    "district_id": districtId == null ? null : districtId,
    "subdistrict_id": subdistrictId == null ? null : subdistrictId,
    "postal_code": postalCode == null ? null : postalCode,
    "status": status == null ? null : status,
    "verified": verified == null ? null : verified,
    "verified_at": verifiedAt == null ? null : verifiedAt,
    "fb_id": fbId,
    "apple_id": appleId,
    "image": image == null ? null : image,
    "device_name": deviceName == null ? null : deviceName,
    "device_id": deviceId == null ? null : deviceId,
    "device_os": deviceOs == null ? null : deviceOs,
    "latitude": latitude == null ? null : latitude,
    "longitude": longitude == null ? null : longitude,
    "referal_id": referalId,
    "referal_code": referalCode == null ? null : referalCode,
    "mitra": mitra == null ? null : mitra,
    "api_token": apiToken,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
    "deleted_at": deletedAt,
    "image_link": imageLink == null ? null : imageLink,
    "greeting_name": greetingName == null ? null : greetingName,
  };
}