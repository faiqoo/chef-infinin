class WorkflowPermission {
  const WorkflowPermission({
    required this.canSubmit,
  });

  factory WorkflowPermission.empty() => const WorkflowPermission(
        canSubmit: false,
      );

  factory WorkflowPermission.fromJson(Map<String, dynamic> json) {
    return WorkflowPermission(
      canSubmit: json['canSubmit'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['canSubmit'] = canSubmit;
    return data;
  }

  final bool canSubmit;
}
