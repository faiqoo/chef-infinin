import 'dart:convert';

FoodDetailsDataRequest foodDataRequestFromJson(String str) =>
    FoodDetailsDataRequest.fromJson(json.decode(str));

String foodDataRequestToJson(FoodDetailsDataRequest data) =>
    json.encode(data.toJson());


class FoodDetailsDataRequest {
  int? t;
  int? userId;

  FoodDetailsDataRequest({this.t, this.userId});

  FoodDetailsDataRequest.fromJson(Map<String, dynamic> json) {
    t = json['t'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['t'] = t;
    data['userId'] = userId;
    return data;
  }
}