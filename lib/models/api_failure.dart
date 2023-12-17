// import 'dart:convert';
//
// import 'package:equatable/equatable.dart';
//
// ApiFailure apiFailureFromJson(String str) =>
//     ApiFailure.fromJson(json.decode(str));
//
// String apiFailureToJson(ApiFailure data) => json.encode(data.toJson());
//
// class ApiFailure extends Equatable {
//   const ApiFailure({
//     required this.code,
//     required this.timestamp,
//     required this.path,
//     required this.error,
//   });
//
//   factory ApiFailure.fromJson(Map<String, dynamic> json) => ApiFailure(
//         code: json['code'],
//         timestamp: DateTime.parse(json['timestamp']),
//         path: json['path'],
//         error: Error.fromJson(json['error']),
//       );
//
//   final int code;
//   final DateTime timestamp;
//   final String path;
//   final Error error;
//
//   Map<String, dynamic> toJson() => {
//         'code': code,
//         'timestamp': timestamp.toIso8601String(),
//         'path': path,
//         'error': error.toJson(),
//       };
//
//   @override
//   List<Object?> get props => [
//         code,
//         timestamp,
//         path,
//         error,
//       ];
// }
//
// class Error extends Equatable {
//   const Error({
//     required this.summary,
//     required this.detail,
//   });
//
//   factory Error.fromJson(Map<String, dynamic> json) => Error(
//         summary: json['summary'],
//         detail: json['detail'] == null
//             ? []
//             : List<String>.from(json['detail'].map((x) => x)),
//       );
//
//   final String summary;
//   final List<String> detail;
//
//   Map<String, dynamic> toJson() => {
//         'summary': summary,
//         'detail': List<dynamic>.from(detail.map((x) => x)),
//       };
//
//   @override
//   List<Object?> get props => [
//         summary,
//         detail,
//       ];
// }

// To parse this JSON data, do
//
//     final apiFailure = apiFailureFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

ApiFailure apiFailureFromJson(String str) =>
    ApiFailure.fromJson(json.decode(str));

String apiFailureToJson(ApiFailure data) => json.encode(data.toJson());

class ApiFailure extends Equatable {
  ApiFailure({
    this.t,
    this.userId,
    this.message,
    required this.error,
    required this.code,
  });

  dynamic t;
  dynamic userId;
  dynamic message;
  String error;
  int code;

  factory ApiFailure.fromJson(Map<String, dynamic> json) => ApiFailure(
        t: json["t"],
        userId: json["userId"],
        message: json["message"],
        error: json["error"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "t": t,
        "userId": userId,
        "message": message,
        "error": error,
        "code": code,
      };

  @override
  List<Object?> get props => [
        t,
        userId,
        message,
        error,
        code,
      ];
}
