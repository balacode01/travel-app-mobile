// To parse this JSON data, do
//
//     final getFeedModelScreen = getFeedModelScreenFromJson(jsonString);

import 'dart:convert';

GetFeedModelScreen getFeedModelScreenFromJson(String str) =>
    GetFeedModelScreen.fromJson(json.decode(str));

String getFeedModelScreenToJson(GetFeedModelScreen data) =>
    json.encode(data.toJson());

class GetFeedModelScreen {
  String? message;
  int? statusCode;
  List<Datum>? data;

  GetFeedModelScreen({this.message, this.statusCode, this.data});

  factory GetFeedModelScreen.fromJson(Map<String, dynamic> json) =>
      GetFeedModelScreen(
        message: json["message"],
        statusCode: json["statusCode"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "statusCode": statusCode,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  String id;
  String userId;
  String name;
  String location;
  DateTime fromDate;
  DateTime toDate;
  String description;
  String totalBudget;
  String coverImage;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.userId,
    required this.name,
    required this.location,
    required this.fromDate,
    required this.toDate,
    required this.description,
    required this.totalBudget,
    required this.coverImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    location: json["location"],
    fromDate: DateTime.parse(json["from_date"]),
    toDate: DateTime.parse(json["to_date"]),
    description: json["description"],
    totalBudget: json["total_budget"],
    coverImage: json["cover_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "location": location,
    "from_date":
        "${fromDate.year.toString().padLeft(4, '0')}-${fromDate.month.toString().padLeft(2, '0')}-${fromDate.day.toString().padLeft(2, '0')}",
    "to_date":
        "${toDate.year.toString().padLeft(4, '0')}-${toDate.month.toString().padLeft(2, '0')}-${toDate.day.toString().padLeft(2, '0')}",
    "description": description,
    "total_budget": totalBudget,
    "cover_image": coverImage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
