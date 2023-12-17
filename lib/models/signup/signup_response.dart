import 'dart:convert';
// import 'package:chef/models/general_model.dart';

SignupResponse signupResponseFromJson(String str) =>
    SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
  SignupResponse({
    required this.t,
    this.userName,
    this.userId,
    this.totalRecords,
    this.currentPage,
    required this.message,
    this.error,
    required this.code,
  });

  T t;
  dynamic userName;
  dynamic userId;
  dynamic totalRecords;
  dynamic currentPage;
  String message;
  dynamic error;
  int code;

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        t: T.fromJson(json["t"]),
        userName: json["userName"],
        userId: json["userId"],
        totalRecords: json["totalRecords"],
        currentPage: json["currentPage"],
        message: json["message"],
        error: json["error"],
        code: json["code"],
      );

  factory SignupResponse.empty() {
    return SignupResponse(
      t: T(
          gender: '',
          age: '',
          mobileNo: '',
          name: '',
          professionalId: 0,
          id: 0),
      message: '',
      code: 0,
    );
  }
  Map<String, dynamic> toJson() => {
        "t": t.toJson(),
        "userName": userName,
        "userId": userId,
        "totalRecords": totalRecords,
        "currentPage": currentPage,
        "message": message,
        "error": error,
        "code": code,
      };
}

//
class T {
  T({
    required this.id,
    required this.name,
    required this.mobileNo,
    required this.gender,
    required this.age,
    required this.professionalId,
    this.profileImageUrl,
  });

  int id;
  String name;
  String mobileNo;
  String gender;
  String age;
  int professionalId;
  dynamic profileImageUrl;

  factory T.fromJson(Map<String, dynamic> json) => T(
        id: json["id"],
        name: json["name"],
        mobileNo: json["mobileNo"],
        gender: json["gender"],
        age: json["age"],
        professionalId: json["professionalId"],
        profileImageUrl: json["profileImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "mobileNo": mobileNo,
        "gender": gender,
        "age": age,
        "professionalId": professionalId,
        "profileImageUrl": profileImageUrl,
      };
}
