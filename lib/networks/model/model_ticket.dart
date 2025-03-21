/*
* Created by Neloy on 21 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';

class TicketModel {
  final String? status;
  final int? id;
  final String? description;
  final String? assign;
  final String? date;
  final List<String>? brand;
  final String? priority;
  final List<String>? tag;

  TicketModel({
    this.status,
    this.id,
    this.description,
    this.assign,
    this.date,
    this.brand,
    this.priority,
    this.tag,
  });

  factory TicketModel.fromRawJson(String str) =>
      TicketModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
    status: json["status"],
    id: json["id"],
    description: json["description"],
    assign: json["assign"],
    date: json["date"],
    brand:
        json["brand"] == null
            ? []
            : List<String>.from(json["brand"]!.map((x) => x)),
    priority: json["priority"],
    tag:
        json["tag"] == null
            ? []
            : List<String>.from(json["tag"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "id": id,
    "description": description,
    "assign": assign,
    "date": date,
    "brand": brand == null ? [] : List<dynamic>.from(brand!.map((x) => x)),
    "priority": priority,
    "tag": tag == null ? [] : List<dynamic>.from(tag!.map((x) => x)),
  };
}
