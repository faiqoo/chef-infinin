import 'dart:convert';
import 'package:chef/models/general_model.dart';

BookingResponse bookingResponseFromJson(String str) =>
    BookingResponse.fromJson(json.decode(str));

String bookingResponseToJson(BookingResponse data) =>
    json.encode(data.toJson());

class BookingResponse {
  BookingResponse({
    required this.t,
    this.userId,
    required this.message,
    this.error,
    required this.code,
  });

  T t;
  dynamic userId;
  String message;
  dynamic error;
  int code;

  factory BookingResponse.fromJson(Map<String, dynamic> json) =>
      BookingResponse(
        t: T.fromJson(json["t"]),
        userId: json["userId"],
        message: json["message"],
        error: json["error"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "t": t.toJson(),
        "userId": userId,
        "message": message,
        "error": error,
        "code": code,
      };
}
