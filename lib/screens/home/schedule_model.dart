import 'dart:convert';
// import 'package:chef/models/general_model.dart';

ScheduleModel scheduleModelFromJson(String str) =>
    ScheduleModel.fromJson(json.decode(str));

String scheduleModelToJson(ScheduleModel data) => json.encode(data.toJson());

class ScheduleModel {
  ScheduleModel({
    required this.t,
    this.userId,
    this.message,
    this.error,
    required this.code,
  });

  T t;
  dynamic userId;
  dynamic message;
  dynamic error;
  int code;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
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
  T({
    required this.experienceId,
    required this.chefId,
    required this.daysGroups,
  });

  int experienceId;
  int chefId;
  List<DaysGroup> daysGroups;

  factory T.fromJson(Map<String, dynamic> json) => T(
        experienceId: json["experienceId"] ?? 0,
        chefId: json["chefId"] ?? 0,
        daysGroups: json["daysGroups"] != null
            ? List<DaysGroup>.from(
                json["daysGroups"].map((x) => DaysGroup.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "experienceId": experienceId,
        "chefId": chefId,
        "daysGroups": List<dynamic>.from(daysGroups.map((x) => x.toJson())),
      };
}

class DaysGroup {
  DaysGroup({
    required this.scheduledDate,
    required this.dayOfMonth,
    required this.hours,
  });

  DateTime scheduledDate;
  int dayOfMonth;
  List<Hour> hours;

  factory DaysGroup.fromJson(Map<String, dynamic> json) => DaysGroup(
        scheduledDate: DateTime.parse(json["scheduledDate"]),
        dayOfMonth: json["dayOfMonth"],
        hours: List<Hour>.from(json["hours"].map((x) => Hour.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "scheduledDate":
            "${scheduledDate.year.toString().padLeft(4, '0')}-${scheduledDate.month.toString().padLeft(2, '0')}-${scheduledDate.day.toString().padLeft(2, '0')}",
        "dayOfMonth": dayOfMonth,
        "hours": List<dynamic>.from(hours.map((x) => x.toJson())),
      };
}

class Hour {
  Hour({
    this.id,
    required this.scheduleId,
    required this.hourOfDay,
    required this.startTime,
    required this.endTime,
    required this.reservedStatus,
  });

  dynamic id;
  int scheduleId;
  int hourOfDay;
  String startTime;
  String endTime;
  String reservedStatus;

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
        id: json["id"],
        scheduleId: json["scheduleId"],
        hourOfDay: json["hourOfDay"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        reservedStatus: json["reservedStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "scheduleId": scheduleId,
        "hourOfDay": hourOfDay,
        "startTime": startTime,
        "endTime": endTime,
        "reservedStatus": reservedStatus,
      };
}
