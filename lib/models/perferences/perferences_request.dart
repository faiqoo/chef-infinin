import 'package:chef/models/general_model.dart';

import '../login/login_request.dart';

// import '../../helpers/data_request.dart';

class PerferencesRequest {
  PerferencesRequest({
    required this.t,
  });

  DataRequest t;

  factory PerferencesRequest.fromJson(Map<String, dynamic> json) =>
      PerferencesRequest(
        t: DataRequest.fromJson(json["t"]),
      );

  Map<String, dynamic> toJson() => {
        "t": t.toJson(),
      };
}
