// To parse this JSON data, do
//
//     final searchModel = searchModelFromJson(jsonString);

import 'dart:convert';

SearchModel searchModelFromJson(String str) =>
    SearchModel.fromJson(json.decode(str));

String searchModelToJson(SearchModel data) => json.encode(data.toJson());

class SearchModel {
  final List<Customer>? jobSeekers;
  final List<Company>? companies;
  final List<Customer>? customers;
  final List<Post>? posts;

  SearchModel({
    this.jobSeekers,
    this.companies,
    this.customers,
    this.posts,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        jobSeekers: json["job_seekers"] == null
            ? []
            : List<Customer>.from(
                json["job_seekers"]!.map((x) => Customer.fromJson(x))),
        companies: json["companies"] == null
            ? []
            : List<Company>.from(
                json["companies"]!.map((x) => Company.fromJson(x))),
        customers: json["customers"] == null
            ? []
            : List<Customer>.from(
                json["customers"]!.map((x) => Customer.fromJson(x))),
        posts: json["posts"] == null
            ? []
            : List<Post>.from(json["posts"]!.map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "job_seekers": jobSeekers == null
            ? []
            : List<dynamic>.from(jobSeekers!.map((x) => x.toJson())),
        "companies": companies == null
            ? []
            : List<dynamic>.from(companies!.map((x) => x.toJson())),
        "customers": customers == null
            ? []
            : List<dynamic>.from(customers!.map((x) => x.toJson())),
        "posts": posts == null
            ? []
            : List<dynamic>.from(posts!.map((x) => x.toJson())),
      };
}

class Company {
  final int? id;
  final String? name;
  final String? password;
  final String? email;
  final int? isActive;
  final String? verificationCode;
  final DateTime? establishmentDate;
  final CompanyType? type;
  final int? employeeNumber;
  final dynamic profilePhoto;

  Company({
    this.id,
    this.name,
    this.password,
    this.email,
    this.isActive,
    this.verificationCode,
    this.establishmentDate,
    this.type,
    this.employeeNumber,
    this.profilePhoto,
  });

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
        isActive: json["isActive"],
        verificationCode: json["verificationCode"],
        establishmentDate: json["establishment_date"] == null
            ? null
            : DateTime.parse(json["establishment_date"]),
        type: companyTypeValues.map[json["type"]]!,
        employeeNumber: json["employee_number"],
        profilePhoto: json["profile_photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "password": password,
        "email": email,
        "isActive": isActive,
        "verificationCode": verificationCode,
        "establishment_date":
            "${establishmentDate!.year.toString().padLeft(4, '0')}-${establishmentDate!.month.toString().padLeft(2, '0')}-${establishmentDate!.day.toString().padLeft(2, '0')}",
        "type": companyTypeValues.reverse[type],
        "employee_number": employeeNumber,
        "profile_photo": profilePhoto,
      };
}

enum CompanyType { COMPANY }

final companyTypeValues = EnumValues({"company": CompanyType.COMPANY});

class Customer {
  final int? id;
  final String? username;
  final String? fullName;
  final int? isActive;
  final String? verificationCode;
  final String? email;
  final String? password;
  final int? wallet;
  final String? profilePhoto;
  final DateTime? birthDate;
  final CustomerType? type;

  Customer({
    this.id,
    this.username,
    this.fullName,
    this.isActive,
    this.verificationCode,
    this.email,
    this.password,
    this.wallet,
    this.profilePhoto,
    this.birthDate,
    this.type,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        username: json["username"],
        fullName: json["full_name"],
        isActive: json["isActive"],
        verificationCode: json["verificationCode"],
        email: json["email"],
        password: json["password"],
        wallet: json["wallet"],
        profilePhoto: json["profile_photo"],
        birthDate: json["birth_date"] == null
            ? null
            : DateTime.parse(json["birth_date"]),
        type: customerTypeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "full_name": fullName,
        "isActive": isActive,
        "verificationCode": verificationCode,
        "email": email,
        "password": password,
        "wallet": wallet,
        "profile_photo": profilePhoto,
        "birth_date":
            "${birthDate!.year.toString().padLeft(4, '0')}-${birthDate!.month.toString().padLeft(2, '0')}-${birthDate!.day.toString().padLeft(2, '0')}",
        "type": customerTypeValues.reverse[type],
      };
}

enum CustomerType { CUSTOMER, JOB_SEEKER }

final customerTypeValues = EnumValues(
    {"customer": CustomerType.CUSTOMER, "job_seeker": CustomerType.JOB_SEEKER});

class Post {
  final int? id;
  final String? title;
  final String? body;
  final String? photo;
  final PostableType? postableType;
  final int? postableId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Post({
    this.id,
    this.title,
    this.body,
    this.photo,
    this.postableType,
    this.postableId,
    this.createdAt,
    this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        photo: json["photo"],
        postableType: postableTypeValues.map[json["postable_type"]]!,
        postableId: json["postable_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "photo": photo,
        "postable_type": postableTypeValues.reverse[postableType],
        "postable_id": postableId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

enum PostableType {
  APP_MODELS_COMPANY,
  APP_MODELS_CUSTOMER,
  APP_MODELS_JOB_SEEKER
}

final postableTypeValues = EnumValues({
  "App\\Models\\Company": PostableType.APP_MODELS_COMPANY,
  "App\\Models\\Customer": PostableType.APP_MODELS_CUSTOMER,
  "App\\Models\\Job_seeker": PostableType.APP_MODELS_JOB_SEEKER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
