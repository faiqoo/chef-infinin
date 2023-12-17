import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachment_details.g.dart';

@JsonSerializable(explicitToJson: true)
class AttachmentDetails {
  factory AttachmentDetails.fromJson(Map<String, dynamic> json) =>
      _$AttachmentDetailsFromJson(json);
  AttachmentDetails({
    required this.message,
    required this.data,
  });

  final String message;
  final Data data;

  Map<String, dynamic> toJson() => _$AttachmentDetailsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Data({
    required this.id,
    required this.tenantID,
    required this.projectID,
    required this.module,
    required this.type,
    required this.size,
    required this.name,
    required this.userAccess,
    required this.createdBy,
    required this.isCompanyLevelAccess,
    required this.versions,
    required this.createdAt,
    required this.location,
    required this.updatedAt,
    required this.updatedBy,
    required this.meta,
    this.groupID,
    this.parentID,
    this.linkedRefID,
    this.linkedID,
    this.folder,
  });

  @JsonKey(name: '_id')
  final String id;
  final String tenantID;
  final String projectID;
  final String module;
  final String name;
  final String? linkedID;
  final dynamic folder;
  final String type;
  final int size;
  final dynamic groupID;
  final Meta meta;
  final dynamic parentID;
  final String? linkedRefID;
  final List<String> userAccess;
  final String createdBy;
  final bool isCompanyLevelAccess;
  final List<Version> versions;
  final DateTime createdAt;
  final String location;
  final DateTime updatedAt;
  final String updatedBy;

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Meta {
  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Meta({
    required this.docTitle,
    required this.userTags,
    required this.docNumber,
    required this.currentSeq,
  });

  final String docTitle;
  final List<dynamic> userTags;
  final String docNumber;
  final int currentSeq;

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Version {
  factory Version.fromJson(Map<String, dynamic> json) =>
      _$VersionFromJson(json);
  Version({
    required this.name,
    required this.createdBy,
    required this.createdAt,
  });

  final String name;
  final String createdBy;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => _$VersionToJson(this);
}
