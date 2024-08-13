// To parse this JSON data, do
//
//     final addLinktopostModel = addLinktopostModelFromJson(jsonString);

import 'dart:convert';

AddLinktopostModel addLinktopostModelFromJson(String str) =>
    AddLinktopostModel.fromJson(json.decode(str));

String addLinktopostModelToJson(AddLinktopostModel data) =>
    json.encode(data.toJson());

class AddLinktopostModel {
  final bool status;
  final String message;
  final int statusNumber;

  AddLinktopostModel({
    required this.status,
    required this.message,
    required this.statusNumber,
  });

  factory AddLinktopostModel.fromJson(Map<String, dynamic> json) =>
      AddLinktopostModel(
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
