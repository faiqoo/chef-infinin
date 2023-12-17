import 'dart:convert';

SignUpQuestionsModel signUpQuestionsModelFromJson(String str) =>
    SignUpQuestionsModel.fromJson(json.decode(str));

String signUpQuestionsModelToJson(SignUpQuestionsModel data) => json.encode(data.toJson());

class SignUpQuestionsModel {
  List<T>? t;
  dynamic userId;
  dynamic message;
  dynamic error;
  int? code;

  SignUpQuestionsModel({this.t, this.userId, this.message, this.error, this.code});

  SignUpQuestionsModel.fromJson(Map<String, dynamic> json) {
    if (json['t'] != null) {
      t = <T>[];
      json['t'].forEach((v) {
        t!.add(new T.fromJson(v));
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

class T {
  int? id;
  String? name;
  String? description;
  String? type;
  String? category;
  List<Answers>? answers;

  T(
      {this.id,
        this.name,
        this.description,
        this.type,
        this.category,
        this.answers});

  T.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    type = json['type'];
    category = json['category'];
    if (json['answers'] != null) {
      answers = <Answers>[];
      json['answers'].forEach((v) {
        answers!.add(new Answers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['type'] = this.type;
    data['category'] = this.category;
    if (this.answers != null) {
      data['answers'] = this.answers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answers {
  int? id;
  String? name;
  String? description;
  int? questionId;
  bool? isSelected=false;

  Answers({this.id, this.name, this.description, this.questionId,this.isSelected});

  Answers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    questionId = json['questionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['questionId'] = this.questionId;
    return data;
  }
}