import 'dart:convert';

BookingListRequest bookingListRequestFromJson(String str) =>
    BookingListRequest.fromJson(json.decode(str));

String bookingListRequestToJson(BookingListRequest data) =>
    json.encode(data.toJson());



class BookingListRequest {
  int? userId;

  BookingListRequest({this.userId});

  BookingListRequest.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    return data;
  }
}