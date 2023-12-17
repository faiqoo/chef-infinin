import 'dart:convert';

Profession professionFromJson(String str) =>
    Profession.fromJson(json.decode(str));

String professionToJson(Profession data) => json.encode(data.toJson());

class Profession {
  Profession({
    required this.t,
    this.userName,
    this.userId,
    this.totalRecords,
    this.currentPage,
    this.message,
    this.error,
    required this.code,
  });

  List<ProfessionData> t;
  dynamic userName;
  dynamic userId;
  dynamic totalRecords;
  dynamic currentPage;
  dynamic message;
  dynamic error;
  int code;

  factory Profession.fromJson(Map<String, dynamic> json) => Profession(
        t: List<ProfessionData>.from(
            json["t"].map((x) => ProfessionData.fromJson(x))),
        userName: json["userName"],
        userId: json["userId"],
        totalRecords: json["totalRecords"],
        currentPage: json["currentPage"],
        message: json["message"],
        error: json["error"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "t": List<dynamic>.from(t.map((x) => x.toJson())),
        "userName": userName,
        "userId": userId,
        "totalRecords": totalRecords,
        "currentPage": currentPage,
        "message": message,
        "error": error,
        "code": code,
      };
}

class ProfessionData {
  ProfessionData({
    required this.id,
    required this.name,
    required this.description,
  });

  int id;
  String name;
  String description;

  factory ProfessionData.fromJson(Map<String, dynamic> json) => ProfessionData(
        id: json["id"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
      };
}
