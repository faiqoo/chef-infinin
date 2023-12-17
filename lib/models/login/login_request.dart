import 'package:chef/models/general_model.dart';

class LoginRequest {
  LoginRequest({
    required this.t,
  });

  DataRequest t;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        t: json["t"] != null ? DataRequest.fromJson(json["t"]) : DataRequest(),
      );

  Map<String, dynamic> toJson() => {
        "t": t != null ? t.toJson() : t,
      };
}

class DataRequest {
  DataRequest({
    this.mobileNo,
  });
  String? mobileNo;

  factory DataRequest.fromJson(Map<String, dynamic> json) => DataRequest(
        mobileNo: json["mobileNumber"],
      );

  Map<String, dynamic> toJson() => {
        "mobileNumber": mobileNo,
      };
}
