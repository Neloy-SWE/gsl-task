/*
* Created by Neloy on 22 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';

class PriorityModel {
  String? priority;

  PriorityModel({this.priority});

  factory PriorityModel.fromRawJson(String str) =>
      PriorityModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PriorityModel.fromJson(Map<String, dynamic> json) =>
      PriorityModel(priority: json["priority"]);

  Map<String, dynamic> toJson() => {"priority": priority};
}
