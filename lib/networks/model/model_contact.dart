/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';

class ContactModel {
  final String? name;
  final String? mail;
  final String? phone;
  final String? address;
  final String? imageUrl;

  ContactModel({this.name, this.mail, this.phone, this.address, this.imageUrl});

  factory ContactModel.fromRawJson(String str) =>
      ContactModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    name: json["name"],
    mail: json["mail"],
    phone: json["phone"],
    address: json["address"],
    imageUrl: json["imageURL"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "mail": mail,
    "phone": phone,
    "address": address,
    "imageURL": imageUrl,
  };
}
