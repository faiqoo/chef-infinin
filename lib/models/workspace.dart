import 'package:equatable/equatable.dart';

class WorkspaceResponse extends Equatable {
  const WorkspaceResponse({required this.workspace});

  factory WorkspaceResponse.fromJson(List<dynamic> json) {
    final workspace = <Workspace>[];
    for (var jsonElement in json) {
      workspace.add(Workspace.fromJson(jsonElement));
    }
    return WorkspaceResponse(workspace: workspace);
  }
  final List<Workspace> workspace;

  @override
  List<Object?> get props => [workspace];
}

class Workspace extends Equatable {
  const Workspace({
    this.id,
    this.refId,
    this.name,
    this.displayName,
    this.tenantID,
    this.createdAt,
    this.createdBy,
  });

  factory Workspace.fromJson(Map<String, dynamic> json) {
    return Workspace(
      id: json['id'] ?? json['_id'],
      refId: json['refId'],
      name: json['name'],
      displayName: json['displayName'],
      tenantID: json['tenantID'],
      createdAt: json['createdAt'],
      createdBy: json['createdBy'],
    );
  }
  final String? id;
  final String? refId;
  final String? name;
  final String? displayName;
  final String? tenantID;
  final int? createdAt;
  final String? createdBy;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['refId'] = refId;
    data['name'] = name;
    data['displayName'] = displayName;
    data['tenantID'] = tenantID;
    data['createdAt'] = createdAt;
    data['createdBy'] = createdBy;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
