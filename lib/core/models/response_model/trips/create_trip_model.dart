// To parse this JSON data, do
//
//     final createTripModelResponse = createTripModelResponseFromJson(jsonString);

import 'dart:convert';

CreateTripModelResponse createTripModelResponseFromJson(String str) =>
    CreateTripModelResponse.fromJson(json.decode(str));

String createTripModelResponseToJson(CreateTripModelResponse data) =>
    json.encode(data.toJson());

class CreateTripModelResponse {
  String? message;
  int? statusCode;
  Trip? trip;

  CreateTripModelResponse({this.message, this.statusCode, this.trip});

  factory CreateTripModelResponse.fromJson(Map<String, dynamic> json) =>
      CreateTripModelResponse(
        message: json["message"],
        statusCode: json["statusCode"],
        trip: Trip.fromJson(json["trip"]),
      );

  Map<String, dynamic> toJson() => {
    "message": message,
    "statusCode": statusCode,
    "trip": trip!.toJson(),
  };
}

class Trip {
  String? id;
  String? userId;
  String? name;
  String? location;
  DateTime? fromDate;
  DateTime? toDate;
  String? description;
  String? totalBudget;
  String? coverImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  Trip({
    this.id,
    this.userId,
    this.name,
    this.location,
    this.fromDate,
    this.toDate,
    this.description,
    this.totalBudget,
    this.coverImage,
    this.createdAt,
    this.updatedAt,
  });

  factory Trip.fromJson(Map<String, dynamic> json) => Trip(
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
        "${fromDate!.year.toString().padLeft(4, '0')}-${fromDate!.month.toString().padLeft(2, '0')}-${fromDate!.day.toString().padLeft(2, '0')}",
    "to_date":
        "${toDate!.year.toString().padLeft(4, '0')}-${toDate!.month.toString().padLeft(2, '0')}-${toDate!.day.toString().padLeft(2, '0')}",
    "description": description,
    "total_budget": totalBudget,
    "cover_image": coverImage,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
