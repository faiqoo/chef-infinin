import 'dart:convert';

ProfessionRequest professionRequestFromJson(String str) =>
    ProfessionRequest.fromJson(json.decode(str));

String professionRequestToJson(ProfessionRequest data) =>
    json.encode(data.toJson());

class ProfessionRequest {
  ProfessionRequest({
    this.builderId,
    this.currentPage,
    required this.t,
    this.totalRecords,
    this.userId,
    this.userName,
  });

  int? builderId;
  int? currentPage;
  T t;
  int? totalRecords;
  int? userId;
  String? userName;

  factory ProfessionRequest.fromJson(Map<String, dynamic> json) =>
      ProfessionRequest(
        builderId: json["builderId"],
        currentPage: json["currentPage"],
        t: T.fromJson(json["t"]),
        totalRecords: json["totalRecords"],
        userId: json["userId"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "builderId": builderId,
        "currentPage": currentPage,
        "t": t.toJson(),
        "totalRecords": totalRecords,
        "userId": userId,
        "userName": userName,
      };
}

class T {
  T();

  factory T.fromJson(Map<String, dynamic> json) => T();

  Map<String, dynamic> toJson() => {};
}
