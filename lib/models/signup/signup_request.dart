import '../../helpers/data_request.dart';

class SignupRequest {
  SignupRequest({
    required this.t,
  });

  T t;

  factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
        t: T.fromJson(json["t"]),
      );

  Map<String, dynamic> toJson() => {
        "t": t.toJson(),
      };
}
