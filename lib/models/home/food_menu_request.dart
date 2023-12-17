import 'dart:convert';

FoodMenuRequest foodMenuRequestFromJson(String str) =>
    FoodMenuRequest.fromJson(json.decode(str));

String foodMenuRequestToJson(FoodMenuRequest data) =>
    json.encode(data.toJson());

class FoodMenuRequest {
  FoodMenuRequest({
    required this.t,
  });

  int t;

  factory FoodMenuRequest.fromJson(Map<String, dynamic> json) =>
      FoodMenuRequest(
        t: json["t"],
      );

  Map<String, dynamic> toJson() => {
        "t": t,
      };
}
