// To parse this JSON data, do
//
//     final perferenceResponse = perferenceResponseFromJson(jsonString);

import 'dart:convert';
import 'package:chef/models/general_model.dart';

PerferenceResponse perferenceResponseFromJson(String str) =>
    PerferenceResponse.fromJson(json.decode(str));

String perferenceResponseToJson(PerferenceResponse data) =>
    json.encode(data.toJson());

class PerferenceResponse {
  PerferenceResponse({
    required this.t,
    this.userId,
    this.message,
    this.error,
    required this.code,
  });

  List<T> t;
  dynamic userId;
  dynamic message;
  dynamic error;
  int code;

  factory PerferenceResponse.fromJson(Map<String, dynamic> json) =>
      PerferenceResponse(
        t: List<T>.from(json["t"].map((x) => T.fromJson(x))),
        userId: json["userId"],
        message: json["message"],
        error: json["error"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "t": List<dynamic>.from(t.map((x) => x.toJson())),
        "userId": userId,
        "message": message,
        "error": error,
        "code": code,
      };
}

// class T {
//   T({
//     required this.id,
//     required this.name,
//     required this.description,
//   });
//
//   int id;
//   String name;
//   String description;
//
//   factory T.fromJson(Map<String, dynamic> json) => T(
//     id: json["id"],
//     name: json["name"],
//     description: json["description"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": name,
//     "description": description,
//   };
// }
