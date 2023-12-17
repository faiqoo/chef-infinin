// // import 'dart:convert';
// //
// // ExperienceListResponse experienceListResponseFromJson(String str) =>
// //     ExperienceListResponse.fromJson(json.decode(str));
// //
// // String experienceListResponseToJson(ExperienceListResponse data) =>
// //     json.encode(data.toJson());
// //
// // class ExperienceListResponse {
// //   ExperienceListResponse({
// //     required this.t,
// //     this.userId,
// //     this.message,
// //     this.error,
// //     required this.code,
// //   });
// //
// //   List<T> t;
// //   dynamic userId;
// //   dynamic message;
// //   dynamic error;
// //   int code;
// //
// //   factory ExperienceListResponse.fromJson(Map<String, dynamic> json) =>
// //       ExperienceListResponse(
// //         t: List<T>.from(json["t"].map((x) => T.fromJson(x))),
// //         userId: json["userId"],
// //         message: json["message"],
// //         error: json["error"],
// //         code: json["code"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "t": List<dynamic>.from(t.map((x) => x.toJson())),
// //         "userId": userId,
// //         "message": message,
// //         "error": error,
// //         "code": code,
// //       };
// // }
// //
// // class T {
// //   T({
// //     required this.id,
// //     required this.title,
// //     required this.description,
// //     required this.wowFactorId,
// //     required this.preferenceId,
// //     required this.price,
// //     required this.priceTypeId,
// //     required this.persons,
// //     required this.locationId,
// //     required this.subHostName,
// //     required this.subHostMobileNo,
// //     required this.experienceWowFactors,
// //     required this.experiencePreferences,
// //   });
// //
// //   int id;
// //   String title;
// //   String description;
// //   int wowFactorId;
// //   int preferenceId;
// //   int price;
// //   int priceTypeId;
// //   String persons;
// //   int locationId;
// //   String subHostName;
// //   String subHostMobileNo;
// //   List<ExperienceWowFactor> experienceWowFactors;
// //   List<ExperiencePreference> experiencePreferences;
// //
// //   factory T.fromJson(Map<String, dynamic> json) => T(
// //         id: json["id"],
// //         title: json["title"],
// //         description: json["description"],
// //         wowFactorId: json["wowFactorId"],
// //         preferenceId: json["preferenceId"],
// //         price: json["price"],
// //         priceTypeId: json["priceTypeId"],
// //         persons: json["persons"],
// //         locationId: json["locationId"],
// //         subHostName: json["subHostName"],
// //         subHostMobileNo: json["subHostMobileNo"],
// //         experienceWowFactors: List<ExperienceWowFactor>.from(
// //             json["experienceWowFactors"]
// //                 .map((x) => ExperienceWowFactor.fromJson(x))),
// //         experiencePreferences: List<ExperiencePreference>.from(
// //             json["experiencePreferences"]
// //                 .map((x) => ExperiencePreference.fromJson(x))),
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "title": title,
// //         "description": description,
// //         "wowFactorId": wowFactorId,
// //         "preferenceId": preferenceId,
// //         "price": price,
// //         "priceTypeId": priceTypeId,
// //         "persons": persons,
// //         "locationId": locationId,
// //         "subHostName": subHostName,
// //         "subHostMobileNo": subHostMobileNo,
// //         "experienceWowFactors":
// //             List<dynamic>.from(experienceWowFactors.map((x) => x.toJson())),
// //         "experiencePreferences":
// //             List<dynamic>.from(experiencePreferences.map((x) => x.toJson())),
// //       };
// // }
// //
// // class ExperiencePreference {
// //   ExperiencePreference({
// //     required this.id,
// //     required this.experienceId,
// //     required this.preferenceId,
// //     required this.preferenceName,
// //     required this.preferenceDescription,
// //     required this.preferenceIconPath,
// //   });
// //
// //   int id;
// //   int experienceId;
// //   int preferenceId;
// //   String preferenceName;
// //   String preferenceDescription;
// //   String preferenceIconPath;
// //
// //   factory ExperiencePreference.fromJson(Map<String, dynamic> json) =>
// //       ExperiencePreference(
// //         id: json["id"],
// //         experienceId: json["experienceId"],
// //         preferenceId: json["preferenceId"],
// //         preferenceName: json["preferenceName"],
// //         preferenceDescription: json["preferenceDescription"],
// //         preferenceIconPath: json["preferenceIconPath"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "experienceId": experienceId,
// //         "preferenceId": preferenceId,
// //         "preferenceName": preferenceName,
// //         "preferenceDescription": preferenceDescription,
// //         "preferenceIconPath": preferenceIconPath,
// //       };
// // }
// //
// // class ExperienceWowFactor {
// //   ExperienceWowFactor({
// //     required this.id,
// //     required this.experienceId,
// //     required this.wowFactorId,
// //     required this.wowFactorName,
// //     required this.wowFactorDescription,
// //     required this.wowFactorIconPath,
// //   });
// //
// //   int id;
// //   int experienceId;
// //   int wowFactorId;
// //   String wowFactorName;
// //   String wowFactorDescription;
// //   String wowFactorIconPath;
// //
// //   factory ExperienceWowFactor.fromJson(Map<String, dynamic> json) =>
// //       ExperienceWowFactor(
// //         id: json["id"],
// //         experienceId: json["experienceId"],
// //         wowFactorId: json["wowFactorId"],
// //         wowFactorName: json["wowFactorName"],
// //         wowFactorDescription: json["wowFactorDescription"],
// //         wowFactorIconPath: json["wowFactorIconPath"],
// //       );
// //
// //   Map<String, dynamic> toJson() => {
// //         "id": id,
// //         "experienceId": experienceId,
// //         "wowFactorId": wowFactorId,
// //         "wowFactorName": wowFactorName,
// //         "wowFactorDescription": wowFactorDescription,
// //         "wowFactorIconPath": wowFactorIconPath,
// //       };
// // }
//
// // To parse this JSON data, do
// //
// //     final experienceListResponse = experienceListResponseFromJson(jsonString);
//
// import 'dart:convert';
//
// ExperienceListResponse experienceListResponseFromJson(String str) =>
//     ExperienceListResponse.fromJson(json.decode(str));
//
// String experienceListResponseToJson(ExperienceListResponse data) =>
//     json.encode(data.toJson());
//
// class ExperienceListResponse {
//   ExperienceListResponse({
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
//   factory ExperienceListResponse.fromJson(Map<String, dynamic> json) =>
//       ExperienceListResponse(
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
//     required this.chefId,
//     required this.chefName,
//     required this.chefBrandName,
//     required this.chefAddress,
//     required this.title,
//     required this.description,
//     required this.wowFactorId,
//     required this.preferenceId,
//     required this.price,
//     required this.priceTypeId,
//     required this.persons,
//     required this.locationId,
//     required this.subHostName,
//     required this.subHostMobileNo,
//     required this.experienceWowFactors,
//     required this.experiencePreferences,
//   });
//
//   int id;
//   int chefId;
//   String chefName;
//   String chefBrandName;
//   String chefAddress;
//   String title;
//   String description;
//   int wowFactorId;
//   int preferenceId;
//   int price;
//   int priceTypeId;
//   String persons;
//   int locationId;
//   String subHostName;
//   String subHostMobileNo;
//   List<ExperienceWowFactor> experienceWowFactors;
//   List<ExperiencePreference> experiencePreferences;
//
//   factory T.fromJson(Map<String, dynamic> json) => T(
//         id: json["id"],
//         chefId: json["chefId"],
//         chefName: json["chefName"],
//         chefBrandName: json["chefBrandName"],
//         chefAddress: json["chefAddress"],
//         title: json["title"],
//         description: json["description"],
//         wowFactorId: json["wowFactorId"],
//         preferenceId: json["preferenceId"],
//         price: json["price"],
//         priceTypeId: json["priceTypeId"],
//         persons: json["persons"],
//         locationId: json["locationId"],
//         subHostName: json["subHostName"],
//         subHostMobileNo: json["subHostMobileNo"],
//         experienceWowFactors: List<ExperienceWowFactor>.from(
//             json["experienceWowFactors"]
//                 .map((x) => ExperienceWowFactor.fromJson(x))),
//         experiencePreferences: List<ExperiencePreference>.from(
//             json["experiencePreferences"]
//                 .map((x) => ExperiencePreference.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "chefId": chefId,
//         "chefName": chefName,
//         "chefBrandName": chefBrandName,
//         "chefAddress": chefAddress,
//         "title": title,
//         "description": description,
//         "wowFactorId": wowFactorId,
//         "preferenceId": preferenceId,
//         "price": price,
//         "priceTypeId": priceTypeId,
//         "persons": persons,
//         "locationId": locationId,
//         "subHostName": subHostName,
//         "subHostMobileNo": subHostMobileNo,
//         "experienceWowFactors":
//             List<dynamic>.from(experienceWowFactors.map((x) => x.toJson())),
//         "experiencePreferences":
//             List<dynamic>.from(experiencePreferences.map((x) => x.toJson())),
//       };
// }
//
// class ExperiencePreference {
//   ExperiencePreference({
//     required this.id,
//     required this.experienceId,
//     required this.preferenceId,
//     required this.preferenceName,
//     required this.preferenceDescription,
//     required this.preferenceIconPath,
//   });
//
//   int id;
//   int experienceId;
//   int preferenceId;
//   String preferenceName;
//   String preferenceDescription;
//   String preferenceIconPath;
//
//   factory ExperiencePreference.fromJson(Map<String, dynamic> json) =>
//       ExperiencePreference(
//         id: json["id"],
//         experienceId: json["experienceId"],
//         preferenceId: json["preferenceId"],
//         preferenceName: json["preferenceName"],
//         preferenceDescription: json["preferenceDescription"],
//         preferenceIconPath: json["preferenceIconPath"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "experienceId": experienceId,
//         "preferenceId": preferenceId,
//         "preferenceName": preferenceName,
//         "preferenceDescription": preferenceDescription,
//         "preferenceIconPath": preferenceIconPath,
//       };
// }
//
// class ExperienceWowFactor {
//   ExperienceWowFactor({
//     required this.id,
//     required this.experienceId,
//     required this.wowFactorId,
//     required this.wowFactorName,
//     required this.wowFactorDescription,
//     this.wowFactorIconPath,
//   });
//
//   int id;
//   int experienceId;
//   int wowFactorId;
//   String wowFactorName;
//   String wowFactorDescription;
//   String? wowFactorIconPath;
//
//   factory ExperienceWowFactor.fromJson(Map<String, dynamic> json) =>
//       ExperienceWowFactor(
//         id: json["id"],
//         experienceId: json["experienceId"],
//         wowFactorId: json["wowFactorId"],
//         wowFactorName: json["wowFactorName"],
//         wowFactorDescription: json["wowFactorDescription"],
//         wowFactorIconPath: json["wowFactorIconPath"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "experienceId": experienceId,
//         "wowFactorId": wowFactorId,
//         "wowFactorName": wowFactorName,
//         "wowFactorDescription": wowFactorDescription,
//         "wowFactorIconPath": wowFactorIconPath,
//       };
// }

// To parse this JSON data, do
//
//     final experienceListResponse = experienceListResponseFromJson(jsonString);

import 'dart:convert';

ExperienceListResponse experienceListResponseFromJson(String str) =>
    ExperienceListResponse.fromJson(json.decode(str));

String experienceListResponseToJson(ExperienceListResponse data) =>
    json.encode(data.toJson());

class ExperienceListResponse {
  ExperienceListResponse({
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

  factory ExperienceListResponse.fromJson(Map<String, dynamic> json) =>
      ExperienceListResponse(
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
    required this.chefId,
    required this.chefName,
    required this.chefBrandName,
    required this.chefAddress,
    required this.title,
    required this.description,
    this.wowFactorId,
    this.preferenceId,
    required this.price,
    required this.priceTypeId,
    required this.persons,
    required this.locationId,
    required this.subHostName,
    required this.subHostMobileNo,
    required this.experienceWowFactors,
    required this.experiencePreferences,
  });

  int id;
  int chefId;
  String chefName;
  String chefBrandName;
  String chefAddress;
  String title;
  String description;
  dynamic wowFactorId;
  dynamic preferenceId;
  int price;
  int priceTypeId;
  String persons;
  int locationId;
  String subHostName;
  String subHostMobileNo;
  List<ExperienceWowFactor> experienceWowFactors;
  List<ExperiencePreference> experiencePreferences;

  factory T.fromJson(Map<String, dynamic> json) => T(
        id: json["id"],
        chefId: json["chefId"],
        chefName: json["chefName"],
        chefBrandName: json["chefBrandName"],
        chefAddress: json["chefAddress"],
        title: json["title"],
        description: json["description"],
        wowFactorId: json["wowFactorId"],
        preferenceId: json["preferenceId"] ?? 1,
        price: json["price"],
        priceTypeId: json["priceTypeId"],
        persons: json["persons"],
        locationId: json["locationId"],
        subHostName: json["subHostName"],
        subHostMobileNo: json["subHostMobileNo"],
        experienceWowFactors: List<ExperienceWowFactor>.from(
            json["experienceWowFactors"]
                .map((x) => ExperienceWowFactor.fromJson(x))),
        experiencePreferences: List<ExperiencePreference>.from(
            json["experiencePreferences"]
                .map((x) => ExperiencePreference.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chefId": chefId,
        "chefName": chefName,
        "chefBrandName": chefBrandName,
        "chefAddress": chefAddress,
        "title": title,
        "description": description,
        "wowFactorId": wowFactorId,
        "preferenceId": preferenceId,
        "price": price,
        "priceTypeId": priceTypeId,
        "persons": persons,
        "locationId": locationId,
        "subHostName": subHostName,
        "subHostMobileNo": subHostMobileNo,
        "experienceWowFactors":
            List<dynamic>.from(experienceWowFactors.map((x) => x.toJson())),
        "experiencePreferences":
            List<dynamic>.from(experiencePreferences.map((x) => x.toJson())),
      };
}

class ExperiencePreference {
  ExperiencePreference({
    required this.id,
    required this.experienceId,
    required this.preferenceId,
    required this.preferenceName,
    required this.preferenceDescription,
    required this.preferenceIconPath,
  });

  int id;
  int experienceId;
  int preferenceId;
  String preferenceName;
  String preferenceDescription;
  String preferenceIconPath;

  factory ExperiencePreference.fromJson(Map<String, dynamic> json) =>
      ExperiencePreference(
        id: json["id"],
        experienceId: json["experienceId"],
        preferenceId: json["preferenceId"],
        preferenceName: json["preferenceName"],
        preferenceDescription: json["preferenceDescription"],
        preferenceIconPath: json["preferenceIconPath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "experienceId": experienceId,
        "preferenceId": preferenceId,
        "preferenceName": preferenceName,
        "preferenceDescription": preferenceDescription,
        "preferenceIconPath": preferenceIconPath,
      };
}

class ExperienceWowFactor {
  ExperienceWowFactor({
    required this.id,
    required this.experienceId,
    required this.wowFactorId,
    required this.wowFactorName,
    required this.wowFactorDescription,
    this.wowFactorIconPath,
  });

  int id;
  int experienceId;
  int wowFactorId;
  String wowFactorName;
  String wowFactorDescription;
  String? wowFactorIconPath;

  factory ExperienceWowFactor.fromJson(Map<String, dynamic> json) =>
      ExperienceWowFactor(
        id: json["id"],
        experienceId: json["experienceId"],
        wowFactorId: json["wowFactorId"],
        wowFactorName: json["wowFactorName"],
        wowFactorDescription: json["wowFactorDescription"],
        wowFactorIconPath: json["wowFactorIconPath"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "experienceId": experienceId,
        "wowFactorId": wowFactorId,
        "wowFactorName": wowFactorName,
        "wowFactorDescription": wowFactorDescription,
        "wowFactorIconPath": wowFactorIconPath,
      };
}
