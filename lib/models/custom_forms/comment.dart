class Comment {
  Comment({
    required this.comment,
    required this.stepName,
    required this.userId,
    required this.cycle,
    required this.status,
    required this.stepNumber,
    required this.updatedDate,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      comment: json['updatedDate'] ?? '',
      stepName: json['stepName'] ?? '',
      userId: json['userID'] ?? '',
      cycle: json['cycle'] ?? 0,
      status: json['status'] ?? '',
      stepNumber: json['stepNumber'] ?? 0,
      updatedDate: json['updatedDate'] ?? '',
    );
  }

  final String comment;
  final String stepName;
  final String userId;
  final int cycle;
  final String status;
  final int stepNumber;
  final String updatedDate;
}
