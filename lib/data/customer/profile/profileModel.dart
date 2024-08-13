// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final bool status;
  final String message;
  final int statusNumber;

  ProfileModel({
    required this.status,
    required this.message,
    required this.statusNumber,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        message: json["message"],
        statusNumber: json["statusNumber"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "statusNumber": statusNumber,
      };
}
