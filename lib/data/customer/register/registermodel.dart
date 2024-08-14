// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  final bool status;
  final String message;
  final String? authToken;
  final int statusNumber;

  RegisterModel({
    required this.status,
    required this.message,
    this.authToken,
    required this.statusNumber,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
      status: json["status"],
      message: json["message"],
      statusNumber: json["statusNumber"],
      authToken: json['customer data']);

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "statusNumber": statusNumber,
      };
}
