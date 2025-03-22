/*
* Created by Neloy on 22 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';

class BrandModel {
  final int? id;
  bool? value;
  final String? name;

  BrandModel({this.id, this.value, this.name});

  factory BrandModel.fromRawJson(String str) =>
      BrandModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BrandModel.fromJson(Map<String, dynamic> json) =>
      BrandModel(id: json["id"], value: json["value"], name: json["name"]);

  Map<String, dynamic> toJson() => {"id": id, "value": value, "name": name};
}
