// To parse this JSON data, do
//
//     final unLikePostModel = unLikePostModelFromJson(jsonString);

import 'dart:convert';

UnLikePostModel unLikePostModelFromJson(String str) =>
    UnLikePostModel.fromJson(json.decode(str));

String unLikePostModelToJson(UnLikePostModel data) =>
    json.encode(data.toJson());

class UnLikePostModel {
  final bool status;
  final String message;
  final int statusNumber;

  UnLikePostModel({
    required this.status,
    required this.message,
    required this.statusNumber,
  });

  factory UnLikePostModel.fromJson(Map<String, dynamic> json) =>
      UnLikePostModel(
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
