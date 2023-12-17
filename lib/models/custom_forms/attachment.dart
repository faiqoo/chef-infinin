import 'package:chef/models/custom_forms/attachment_details.dart';

class Attachment {
  Attachment({
    required this.id,
    required this.tenantID,
    required this.projectID,
    required this.name,
    required this.module,
    required this.linkedID,
    required this.parentID,
    required this.folder,
    required this.size,
    required this.userAccess,
    required this.versions,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    var userAccess = <String>[];
    if (json['userAccess'] != null) {
      final j = json['userAccess'] as List;
      for (var item in j) {
        userAccess.add(item);
      }
    }
    return Attachment(
      id: json['_id'] ?? '',
      tenantID: json['tenantID'] ?? '',
      projectID: json['projectID'] ?? '',
      name: json['name'] ?? '',
      module: json['module'],
      linkedID: json['linkedID'],
      parentID: json['parentID'] ?? '',
      folder: json['folder'],
      size: json['size'] ?? 0,
      userAccess: userAccess,
      versions:
          List<Version>.from(json['versions'].map((x) => Version.fromJson(x))),
    );
  }

  final String id;
  final String tenantID;
  final String projectID;
  final String name;
  final String? module;
  final String? linkedID;
  final String parentID;
  final String? folder;
  final int size;
  final List<String> userAccess;
  final List<Version> versions;
}
