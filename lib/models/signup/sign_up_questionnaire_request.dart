

import 'dart:convert';

SignUpQuestionsRequest signUpQuestionsRequestFromJson(String str) =>
    SignUpQuestionsRequest.fromJson(json.decode(str));

String signUpQuestionsRequestToJson(SignUpQuestionsRequest data) =>
    json.encode(data.toJson());



class SignUpQuestionsRequest {
  T? t;

  SignUpQuestionsRequest({this.t});

  SignUpQuestionsRequest.fromJson(Map<String, dynamic> json) {
    t = json['t'] != null ? new T.fromJson(json['t']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.t != null) {
      data['t'] = this.t!.toJson();
    }
    return data;
  }
}

class T {
  int? userId;

  T({this.userId});

  T.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    return data;
  }
}