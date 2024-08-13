// To parse this JSON data, do
//
//     final addOfferModel = addOfferModelFromJson(jsonString);

import 'dart:convert';

AddOfferModel addOfferModelFromJson(String str) =>
    AddOfferModel.fromJson(json.decode(str));

String addOfferModelToJson(AddOfferModel data) => json.encode(data.toJson());

class AddOfferModel {
  final bool status;
  final String message;
  final int statusNumber;

  AddOfferModel({
    required this.status,
    required this.message,
    required this.statusNumber,
  });

  factory AddOfferModel.fromJson(Map<String, dynamic> json) => AddOfferModel(
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
