class AccessTokenRequest {
  AccessTokenRequest({
    required this.tenantId,
  });

  factory AccessTokenRequest.fromJson(Map<String, dynamic> json) =>
      AccessTokenRequest(
        tenantId: json['tenantId'],
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tenantId'] = tenantId;
    return data;
  }

  final String tenantId;
}
