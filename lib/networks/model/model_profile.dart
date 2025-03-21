/*
* Created by Neloy on 22 March, 2025.
* Email: taufiqneloy.swe@gmail.com
*/

import 'dart:convert';

class ProfileModel {
  final String? profileTitle;
  final String? position;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? imageUrl;
  final List<AssignedRole>? assignedRole;

  ProfileModel({
    this.profileTitle,
    this.position,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
    this.assignedRole,
  });

  factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    profileTitle: json["profileTitle"],
    position: json["position"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    imageUrl: json["imageURL"],
    assignedRole: json["assignedRole"] == null ? [] : List<AssignedRole>.from(json["assignedRole"]!.map((x) => AssignedRole.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "profileTitle": profileTitle,
    "position": position,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "imageURL": imageUrl,
    "assignedRole": assignedRole == null ? [] : List<dynamic>.from(assignedRole!.map((x) => x.toJson())),
  };
}

class AssignedRole {
  final String? role;
  final String? group;
  final String? roleImageUrl;
  final String? managerName;

  AssignedRole({
    this.role,
    this.group,
    this.roleImageUrl,
    this.managerName,
  });

  factory AssignedRole.fromRawJson(String str) => AssignedRole.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AssignedRole.fromJson(Map<String, dynamic> json) => AssignedRole(
    role: json["role"],
    group: json["group"],
    roleImageUrl: json["roleImageURL"],
    managerName: json["managerName"],
  );

  Map<String, dynamic> toJson() => {
    "role": role,
    "group": group,
    "roleImageURL": roleImageUrl,
    "managerName": managerName,
  };
}
