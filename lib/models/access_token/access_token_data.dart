class AccessTokenData {
  AccessTokenData({
    required this.accessToken,
    required this.idToken,
  });

  factory AccessTokenData.fromJson(Map<String, dynamic> json) {
    return AccessTokenData(
      accessToken: json['access_token'],
      idToken: json['id_token'],
    );
  }

  factory AccessTokenData.empty() {
    return AccessTokenData(
      accessToken: '',
      idToken: '',
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['id_token'] = idToken;
    return data;
  }

  final String accessToken;
  final String idToken;
}
