
import 'dart:convert';

FoodDetailsResponse foodDataResponseFromJson(String str) =>
    FoodDetailsResponse.fromJson(json.decode(str));

String foodDataResponseToJson(FoodDetailsResponse data) =>
    json.encode(data.toJson());

class FoodDetailsResponse {
  T? t;
  dynamic userId;
  dynamic message;
  dynamic error;
  int? code;

  FoodDetailsResponse(
      {this.t, this.userId, this.message, this.error, this.code});

  FoodDetailsResponse.fromJson(Map<String, dynamic> json) {
    t = json['t'] != null ? new T.fromJson(json['t']) : null;
    userId = json['userId'];
    message = json['message'];
    error = json['error'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.t != null) {
      data['t'] = this.t!.toJson();
    }
    data['userId'] = this.userId;
    data['message'] = this.message;
    data['error'] = this.error;
    data['code'] = this.code;
    return data;
  }
}

class T {
  dynamic id;
  dynamic experience;
  List<dynamic>? experienceMenu;
  List<dynamic>? foodieProfile;
  dynamic comments;
  dynamic totalPrice;
  dynamic advancePayment;
  dynamic priceTypeId;
  dynamic bookingStatus;
  dynamic foodieName;
  dynamic foodieProfession;
  dynamic foodieAge;
  dynamic scheduleId;
  dynamic scheduleScheduledDate;
  dynamic scheduleStartTime;
  dynamic scheduleDayOfMonth;
  dynamic persons;
  dynamic preferenceId;
  dynamic preferenceName;
  dynamic preferenceDescription;
  dynamic preferenceIconPath;
  dynamic experienceName;
  dynamic chefId;
  dynamic brandName;
  dynamic subHost;
  dynamic address;
  dynamic tax;
  dynamic advancePercentage;

  T({
    this.id,
    this.experience,
    this.experienceMenu,
    this.foodieProfile,
    this.comments,
    this.totalPrice,
    this.advancePayment,
    this.priceTypeId,
    this.bookingStatus,
    this.foodieName,
    this.foodieProfession,
    this.foodieAge,
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
    this.brandName,
    this.subHost,
    this.address,
    this.tax,
    this.advancePercentage,
  });

  T.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    experience = json['experience'] != null ? json['experience'] : null;
    if (json['experienceMenu'] != null) {
      experienceMenu = <dynamic>[];
      json['experienceMenu'].forEach((v) {
        experienceMenu!.add(v);
      });
    }
    if (json['foodieProfile'] != null) {
      foodieProfile = <dynamic>[];
      json['foodieProfile'].forEach((v) {
        foodieProfile!.add(v);
      });
    }
    comments = json['comments'];
    totalPrice = json['totalPrice'];
    advancePayment = json['advancePayment'];
    priceTypeId = json['priceTypeId'];
    bookingStatus = json['bookingStatus'];
    foodieName = json['foodieName'];
    foodieProfession = json['foodieProfession'];
    foodieAge = json['foodieAge'];
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
    subHost = json['subHost'];
    address = json['address'];
    tax = json['tax'];
    advancePercentage = json['advancePercentage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['experience'] = this.experience;
    if (this.experienceMenu != null) {
      data['experienceMenu'] = this.experienceMenu!.toList();
    }
    if (this.foodieProfile != null) {
      data['foodieProfile'] = this.foodieProfile!.toList();
    }
    data['comments'] = this.comments;
    data['totalPrice'] = this.totalPrice;
    data['advancePayment'] = this.advancePayment;
    data['priceTypeId'] = this.priceTypeId;
    data['bookingStatus'] = this.bookingStatus;
    data['foodieName'] = this.foodieName;
    data['foodieProfession'] = this.foodieProfession;
    data['foodieAge'] = this.foodieAge;
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
    data['subHost'] = this.subHost;
    data['address'] = this.address;
    data['tax'] = this.tax;
    data['advancePercentage'] = this.advancePercentage;
    return data;
  }
}




    class Experience {
  int? id;
  int? chefId;
  String? chefName;
  String? chefBrandName;
  String? chefAddress;
  String? title;
  String? description;
  Null? wowFactorId;
  Null? preferenceId;
  int? price;
  int? priceTypeId;
  String? persons;
  int? locationId;
  String? subHostName;
  List<ExperienceWowFactors>? experienceWowFactors;
  List<ExperiencePreferences>? experiencePreferences;

  Experience(
      {this.id,
        this.chefId,
        this.chefName,
        this.chefBrandName,
        this.chefAddress,
        this.title,
        this.description,
        this.wowFactorId,
        this.preferenceId,
        this.price,
        this.priceTypeId,
        this.persons,
        this.locationId,
        this.subHostName,
        this.experienceWowFactors,
        this.experiencePreferences});

  Experience.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chefId = json['chefId'];
    chefName = json['chefName'];
    chefBrandName = json['chefBrandName'];
    chefAddress = json['chefAddress'];
    title = json['title'];
    description = json['description'];
    wowFactorId = json['wowFactorId'];
    preferenceId = json['preferenceId'];
    price = json['price'];
    priceTypeId = json['priceTypeId'];
    persons = json['persons'];
    locationId = json['locationId'];
    subHostName = json['subHostName'];
    if (json['experienceWowFactors'] != null) {
      experienceWowFactors = <ExperienceWowFactors>[];
      json['experienceWowFactors'].forEach((v) {
        experienceWowFactors!.add(new ExperienceWowFactors.fromJson(v));
      });
    }
    if (json['experiencePreferences'] != null) {
      experiencePreferences = <ExperiencePreferences>[];
      json['experiencePreferences'].forEach((v) {
        experiencePreferences!.add(new ExperiencePreferences.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chefId'] = this.chefId;
    data['chefName'] = this.chefName;
    data['chefBrandName'] = this.chefBrandName;
    data['chefAddress'] = this.chefAddress;
    data['title'] = this.title;
    data['description'] = this.description;
    data['wowFactorId'] = this.wowFactorId;
    data['preferenceId'] = this.preferenceId;
    data['price'] = this.price;
    data['priceTypeId'] = this.priceTypeId;
    data['persons'] = this.persons;
    data['locationId'] = this.locationId;
    data['subHostName'] = this.subHostName;
    if (this.experienceWowFactors != null) {
      data['experienceWowFactors'] =
          this.experienceWowFactors!.map((v) => v.toJson()).toList();
    }
    if (this.experiencePreferences != null) {
      data['experiencePreferences'] =
          this.experiencePreferences!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ExperienceWowFactors {
  int? id;
  int? experienceId;
  int? wowFactorId;
  String? wowFactorName;
  String? wowFactorDescription;
  String? wowFactorIconPath;

  ExperienceWowFactors(
      {this.id,
        this.experienceId,
        this.wowFactorId,
        this.wowFactorName,
        this.wowFactorDescription,
        this.wowFactorIconPath});

  ExperienceWowFactors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    experienceId = json['experienceId'];
    wowFactorId = json['wowFactorId'];
    wowFactorName = json['wowFactorName'];
    wowFactorDescription = json['wowFactorDescription'];
    wowFactorIconPath = json['wowFactorIconPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['experienceId'] = this.experienceId;
    data['wowFactorId'] = this.wowFactorId;
    data['wowFactorName'] = this.wowFactorName;
    data['wowFactorDescription'] = this.wowFactorDescription;
    data['wowFactorIconPath'] = this.wowFactorIconPath;
    return data;
  }
}

class ExperiencePreferences {
  int? id;
  int? experienceId;
  int? preferenceId;
  String? preferenceName;
  String? preferenceDescription;
  String? preferenceIconPath;

  ExperiencePreferences(
      {this.id,
        this.experienceId,
        this.preferenceId,
        this.preferenceName,
        this.preferenceDescription,
        this.preferenceIconPath});

  ExperiencePreferences.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    experienceId = json['experienceId'];
    preferenceId = json['preferenceId'];
    preferenceName = json['preferenceName'];
    preferenceDescription = json['preferenceDescription'];
    preferenceIconPath = json['preferenceIconPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['experienceId'] = this.experienceId;
    data['preferenceId'] = this.preferenceId;
    data['preferenceName'] = this.preferenceName;
    data['preferenceDescription'] = this.preferenceDescription;
    data['preferenceIconPath'] = this.preferenceIconPath;
    return data;
  }
}

class ExperienceMenu {
  int? id;
  String? dish;
  int? mealId;
  String? mealName;
  int? baseDishId;
  String? baseDishName;
  int? experienceId;
  String? description;
  int? price;
  String? pictureUrl;

  ExperienceMenu(
      {this.id,
        this.dish,
        this.mealId,
        this.mealName,
        this.baseDishId,
        this.baseDishName,
        this.experienceId,
        this.description,
        this.price,
        this.pictureUrl});

  ExperienceMenu.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dish = json['dish'];
    mealId = json['mealId'];
    mealName = json['mealName'];
    baseDishId = json['baseDishId'];
    baseDishName = json['baseDishName'];
    experienceId = json['experienceId'];
    description = json['description'];
    price = json['price'];
    pictureUrl = json['pictureUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dish'] = this.dish;
    data['mealId'] = this.mealId;
    data['mealName'] = this.mealName;
    data['baseDishId'] = this.baseDishId;
    data['baseDishName'] = this.baseDishName;
    data['experienceId'] = this.experienceId;
    data['description'] = this.description;
    data['price'] = this.price;
    data['pictureUrl'] = this.pictureUrl;
    return data;
  }
}