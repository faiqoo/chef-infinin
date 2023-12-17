// // To parse this JSON data, do
// //
// //     final foodMenuModel = foodMenuModelFromJson(jsonString);
//
// import 'dart:convert';
//
// FoodMenuModel foodMenuModelFromJson(String str) =>
//     FoodMenuModel.fromJson(json.decode(str));
//
// String foodMenuModelToJson(FoodMenuModel data) => json.encode(data.toJson());
//
// class FoodMenuModel {
//   FoodMenuModel({
//     required this.t,
//     this.userId,
//     this.message,
//     this.error,
//     required this.code,
//   });
//
//   List<T> t;
//   dynamic userId;
//   dynamic message;
//   dynamic error;
//   int code;
//
//   factory FoodMenuModel.fromJson(Map<String, dynamic> json) => FoodMenuModel(
//         t: List<T>.from(json["t"].map((x) => T.fromJson(x))),
//         userId: json["userId"],
//         message: json["message"],
//         error: json["error"],
//         code: json["code"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "t": List<dynamic>.from(t.map((x) => x.toJson())),
//         "userId": userId,
//         "message": message,
//         "error": error,
//         "code": code,
//       };
// }
//
// class T {
//   T({
//     required this.id,
//     required this.dish,
//     required this.mealId,
//     required this.dishId,
//     required this.experienceId,
//     required this.description,
//     required this.price,
//     required this.pictureUrl,
//   });
//
//   int id;
//   String dish;
//   int mealId;
//   int dishId;
//   int experienceId;
//   String description;
//   int price;
//   String pictureUrl;
//
//   factory T.fromJson(Map<String, dynamic> json) => T(
//         id: json["id"],
//         dish: json["dish"],
//         mealId: json["mealId"],
//         dishId: json["dishId"],
//         experienceId: json["experienceId"],
//         description: json["description"],
//         price: json["price"],
//         pictureUrl: json["pictureUrl"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "dish": dish,
//         "mealId": mealId,
//         "dishId": dishId,
//         "experienceId": experienceId,
//         "description": description,
//         "price": price,
//         "pictureUrl": pictureUrl,
//       };
// }
// To parse this JSON data, do
//
//     final foodMenuModel = foodMenuModelFromJson(jsonString);

import 'dart:convert';

FoodMenuModel foodMenuModelFromJson(String str) =>
    FoodMenuModel.fromJson(json.decode(str));

String foodMenuModelToJson(FoodMenuModel data) => json.encode(data.toJson());

class FoodMenuModel {
  FoodMenuModel({
    required this.t,
    this.userId,
    this.message,
    this.error,
    required this.code,
  });

  List<T> t;
  dynamic userId;
  dynamic message;
  dynamic error;
  int code;

  factory FoodMenuModel.fromJson(Map<String, dynamic> json) => FoodMenuModel(
        t: List<T>.from(json["t"].map((x) => T.fromJson(x))),
        userId: json["userId"],
        message: json["message"],
        error: json["error"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "t": List<dynamic>.from(t.map((x) => x.toJson())),
        "userId": userId,
        "message": message,
        "error": error,
        "code": code,
      };
}

class T {
  T({
    required this.id,
    required this.dish,
    required this.mealId,
    required this.mealName,
    required this.baseDishId,
    required this.baseDishName,
    required this.experienceId,
    required this.description,
    required this.price,
    required this.pictureUrl,
  });

  int id;
  String dish;
  int mealId;
  String mealName;
  int baseDishId;
  String baseDishName;
  int experienceId;
  String description;
  int price;
  String pictureUrl;

  factory T.fromJson(Map<String, dynamic> json) => T(
        id: json["id"],
        dish: json["dish"],
        mealId: json["mealId"],
        mealName: json["mealName"],
        baseDishId: json["baseDishId"],
        baseDishName: json["baseDishName"],
        experienceId: json["experienceId"],
        description: json["description"],
        price: json["price"],
        pictureUrl: json["pictureUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dish": dish,
        "mealId": mealId,
        "mealName": mealName,
        "baseDishId": baseDishId,
        "baseDishName": baseDishName,
        "experienceId": experienceId,
        "description": description,
        "price": price,
        "pictureUrl": pictureUrl,
      };
}
