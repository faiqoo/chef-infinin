import 'dart:convert';

BookingListModel bookingListModelFromJson(String str) =>
    BookingListModel.fromJson(json.decode(str));

String bookingListModelToJson(BookingListModel data) => json.encode(data.toJson());


class BookingListModel {
  List<BookingItem>? t;
  dynamic userId;
  dynamic message;
  dynamic error;
  int? code;

  BookingListModel({this.t, this.userId, this.message, this.error, this.code});

  BookingListModel.fromJson(Map<String, dynamic> json) {
    if (json['t'] != null) {
      t = <BookingItem>[];
      json['t'].forEach((v) {
        t!.add(new BookingItem.fromJson(v));
      });
    }
    userId = json['userId'];
    message = json['message'];
    error = json['error'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.t != null) {
      data['t'] = this.t!.map((v) => v.toJson()).toList();
    }
    data['userId'] = this.userId;
    data['message'] = this.message;
    data['error'] = this.error;
    data['code'] = this.code;
    return data;
  }
}

class BookingItem {
  int? id;
  int? experienceId;
  int? foodieId;
  String? comments;
  int? totalPrice;
  int? priceTypeId;
  String? bookingStatus;
  int? scheduleId;
  String? scheduleScheduledDate;
  String? scheduleStartTime;
  int? scheduleDayOfMonth;
  String? persons;
  int? preferenceId;
  String? preferenceName;
  String? preferenceDescription;
  String? preferenceIconPath;
  String? experienceName;
  int? chefId;
  String? brandName;

  BookingItem(
      {this.id,
        this.experienceId,
        this.foodieId,
        this.comments,
        this.totalPrice,
        this.priceTypeId,
        this.bookingStatus,
        this.scheduleId,
        this.scheduleScheduledDate,
        this.scheduleStartTime,
        this.scheduleDayOfMonth,
        this.persons,
        this.preferenceId,
        this.preferenceName,
        this.preferenceDescription,
        this.preferenceIconPath,
        this.experienceName,
        this.chefId,
        this.brandName});

  BookingItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    experienceId = json['experienceId'];
    foodieId = json['foodieId'];
    comments = json['comments'];
    totalPrice = json['totalPrice'];
    priceTypeId = json['priceTypeId'];
    bookingStatus = json['bookingStatus'];
    scheduleId = json['scheduleId'];
    scheduleScheduledDate = json['scheduleScheduledDate'];
    scheduleStartTime = json['scheduleStartTime'];
    scheduleDayOfMonth = json['scheduleDayOfMonth'];
    persons = json['persons'];
    preferenceId = json['preferenceId'];
    preferenceName = json['preferenceName'];
    preferenceDescription = json['preferenceDescription'];
    preferenceIconPath = json['preferenceIconPath'];
    experienceName = json['experienceName'];
    chefId = json['chefId'];
    brandName = json['brandName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['experienceId'] = this.experienceId;
    data['foodieId'] = this.foodieId;
    data['comments'] = this.comments;
    data['totalPrice'] = this.totalPrice;
    data['priceTypeId'] = this.priceTypeId;
    data['bookingStatus'] = this.bookingStatus;
    data['scheduleId'] = this.scheduleId;
    data['scheduleScheduledDate'] = this.scheduleScheduledDate;
    data['scheduleStartTime'] = this.scheduleStartTime;
    data['scheduleDayOfMonth'] = this.scheduleDayOfMonth;
    data['persons'] = this.persons;
    data['preferenceId'] = this.preferenceId;
    data['preferenceName'] = this.preferenceName;
    data['preferenceDescription'] = this.preferenceDescription;
    data['preferenceIconPath'] = this.preferenceIconPath;
    data['experienceName'] = this.experienceName;
    data['chefId'] = this.chefId;
    data['brandName'] = this.brandName;
    return data;
  }
}