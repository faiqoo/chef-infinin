import '../screens/home/schedule_model.dart';

class T {
  T({
    this.id,
    this.experienceId,
    this.foodieId,
    this.comments,
    this.totalPrice,
    this.mobileNo,
    this.name,
    this.description,
    this.chefId,
    this.daysGroups,
    this.gender,
    this.age,
    this.professionalId,
    this.profileImageUrl,
  });

  int? id;
  int? experienceId;
  int? foodieId;
  String? comments;
  int? totalPrice;
  String? mobileNo;
  String? name;
  String? description;
  int? chefId;
  List<DaysGroup>? daysGroups;

  String? gender;
  String? age;
  int? professionalId;
  dynamic profileImageUrl;

  factory T.fromJson(Map<String, dynamic> json) => T(
        id: json["id"] ?? '',
        experienceId: json["experienceId"] ?? 0,
        foodieId: json["foodieId"] ?? 45,
        comments: json["comments"] ?? '',
        totalPrice: json["totalPrice"] ?? 500,
        mobileNo: json["mobileNo"] ?? '0',
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        chefId: json["chefId"] ?? '',
        daysGroups: json["daysGroups"] != null
            ? List<DaysGroup>.from(
                json["daysGroups"].map((x) => DaysGroup.fromJson(x)))
            : [],
        gender: json["gender"] ?? '',
        age: json["age"] ?? '',
        professionalId: json["professionalId"] ?? 0,
        profileImageUrl: json["profileImageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "experienceId": experienceId,
        "foodieId": foodieId,
        "comments": comments,
        "totalPrice": totalPrice,
        "mobileNo": mobileNo,
        "name": name,
        "description": description,
        "chefId": chefId,
        "daysGroups": List<dynamic>.from(daysGroups!.map((x) => x.toJson())),
        "gender": gender,
        "age": age,
        "professionalId": professionalId,
        "profileImageUrl": profileImageUrl,
      };
}

// class T {
//   T({
//     this.mobileNo,
//   });
//   String? mobileNo;
//
//   factory T.fromJson(Map<String, dynamic> json) => T(
//     mobileNo: json["mobileNumber"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "mobileNumber": mobileNo,
//   };
// }
