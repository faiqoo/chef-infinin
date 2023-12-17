import 'dart:convert';

ConfirmedBookingResponse confirmedBookingResponseFromJson(String str) =>
    ConfirmedBookingResponse.fromJson(json.decode(str));

String confirmedBookingResponseToJson(ConfirmedBookingResponse data) =>
    json.encode(data.toJson());

class ConfirmedBookingResponse {
  T t;
  dynamic userId;
  dynamic message;
  dynamic error;
  int code;

  ConfirmedBookingResponse({
    required this.t,
    this.userId,
    this.message,
    this.error,
    required this.code,
  });

  factory ConfirmedBookingResponse.fromJson(Map<String, dynamic> json) =>
      ConfirmedBookingResponse(
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

class T {
  int id;
  int experienceId;
  int foodieId;
  String foodieName;
  String comments;
  int totalPrice;
  int priceTypeId;
  String bookingStatus;
  int scheduleId;
  DateTime scheduleScheduledDate;
  String scheduleStartTime;
  int scheduleDayOfMonth;
  String persons;
  int preferenceId;
  String preferenceName;
  String preferenceDescription;
  String preferenceIconPath;
  String experienceName;
  int chefId;
  String brandName;
  int verificationCode;

  T({
    required this.id,
    required this.experienceId,
    required this.foodieId,
    required this.foodieName,
    required this.comments,
    required this.totalPrice,
    required this.priceTypeId,
    required this.bookingStatus,
    required this.scheduleId,
    required this.scheduleScheduledDate,
    required this.scheduleStartTime,
    required this.scheduleDayOfMonth,
    required this.persons,
    required this.preferenceId,
    required this.preferenceName,
    required this.preferenceDescription,
    required this.preferenceIconPath,
    required this.experienceName,
    required this.chefId,
    required this.brandName,
    required this.verificationCode,
  });

  factory T.fromJson(Map<String, dynamic> json) => T(
        id: json["id"],
        experienceId: json["experienceId"],
        foodieId: json["foodieId"],
        foodieName: json["foodieName"],
        comments: json["comments"],
        totalPrice: json["totalPrice"],
        priceTypeId: json["priceTypeId"],
        bookingStatus: json["bookingStatus"],
        scheduleId: json["scheduleId"],
        scheduleScheduledDate: DateTime.parse(json["scheduleScheduledDate"]),
        scheduleStartTime: json["scheduleStartTime"],
        scheduleDayOfMonth: json["scheduleDayOfMonth"],
        persons: json["persons"],
        preferenceId: json["preferenceId"],
        preferenceName: json["preferenceName"],
        preferenceDescription: json["preferenceDescription"],
        preferenceIconPath: json["preferenceIconPath"],
        experienceName: json["experienceName"],
        chefId: json["chefId"],
        brandName: json["brandName"],
        verificationCode: json["verificationCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "experienceId": experienceId,
        "foodieId": foodieId,
        "foodieName": foodieName,
        "comments": comments,
        "totalPrice": totalPrice,
        "priceTypeId": priceTypeId,
        "bookingStatus": bookingStatus,
        "scheduleId": scheduleId,
        "scheduleScheduledDate":
            "${scheduleScheduledDate.year.toString().padLeft(4, '0')}-${scheduleScheduledDate.month.toString().padLeft(2, '0')}-${scheduleScheduledDate.day.toString().padLeft(2, '0')}",
        "scheduleStartTime": scheduleStartTime,
        "scheduleDayOfMonth": scheduleDayOfMonth,
        "persons": persons,
        "preferenceId": preferenceId,
        "preferenceName": preferenceName,
        "preferenceDescription": preferenceDescription,
        "preferenceIconPath": preferenceIconPath,
        "experienceName": experienceName,
        "chefId": chefId,
        "brandName": brandName,
        "verificationCode": verificationCode,
      };
}
