import 'package:equatable/equatable.dart';

class AccessTokenResponse extends Equatable {
  const AccessTokenResponse({
    required this.accessToken,
    required this.idToken,
    required this.message,
  });

  factory AccessTokenResponse.fromJson(Map<String, dynamic> json) {
    return AccessTokenResponse(
      accessToken: json['access_token'],
      idToken: json['id_token'],
      message: json['message'] ?? '',
    );
  }

  factory AccessTokenResponse.fromErrorJson(Map<String, dynamic> json) {
    return AccessTokenResponse(
      accessToken: '',
      idToken: '',
      message: json['message'],
    );
  }

  factory AccessTokenResponse.empty() {
    return const AccessTokenResponse(
      accessToken: '',
      idToken: '',
      message: '',
    );
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['id_token'] = idToken;
    data['message'] = message;
    return data;
  }

  final String accessToken;
  final String idToken;
  final String message;

  @override
  List<Object?> get props => [
        accessToken,
        idToken,
      ];
}
