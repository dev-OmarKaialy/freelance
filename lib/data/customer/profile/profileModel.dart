// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  final Data? data;

  ProfileModel({
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  final int? id;
  final String? name;
  final String? email;
  final String? photo;
  final List<dynamic>? posts;

  Data({
    this.id,
    this.name,
    this.email,
    this.photo,
    this.posts,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        photo: json["photo"],
        posts: json["posts"] == null
            ? []
            : List<dynamic>.from(json["posts"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "photo": photo,
        "posts": posts == null ? [] : List<dynamic>.from(posts!.map((x) => x)),
      };
}
