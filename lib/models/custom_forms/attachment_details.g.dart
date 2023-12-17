// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttachmentDetails _$AttachmentDetailsFromJson(Map<String, dynamic> json) =>
    AttachmentDetails(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AttachmentDetailsToJson(AttachmentDetails instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: json['_id'] as String,
      tenantID: json['tenantID'] as String,
      projectID: json['projectID'] as String,
      module: json['module'] as String,
      type: json['type'] as String,
      size: json['size'] as int,
      name: json['name'] as String,
      userAccess: (json['userAccess'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdBy: json['createdBy'] as String,
      isCompanyLevelAccess: json['isCompanyLevelAccess'] as bool,
      versions: (json['versions'] as List<dynamic>)
          .map((e) => Version.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      location: json['location'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      updatedBy: json['updatedBy'] as String,
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      groupID: json['groupID'],
      parentID: json['parentID'],
      linkedRefID: json['linkedRefID'] as String?,
      linkedID: json['linkedID'] as String?,
      folder: json['folder'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      '_id': instance.id,
      'tenantID': instance.tenantID,
      'projectID': instance.projectID,
      'module': instance.module,
      'name': instance.name,
      'linkedID': instance.linkedID,
      'folder': instance.folder,
      'type': instance.type,
      'size': instance.size,
      'groupID': instance.groupID,
      'meta': instance.meta.toJson(),
      'parentID': instance.parentID,
      'linkedRefID': instance.linkedRefID,
      'userAccess': instance.userAccess,
      'createdBy': instance.createdBy,
      'isCompanyLevelAccess': instance.isCompanyLevelAccess,
      'versions': instance.versions.map((e) => e.toJson()).toList(),
      'createdAt': instance.createdAt.toIso8601String(),
      'location': instance.location,
      'updatedAt': instance.updatedAt.toIso8601String(),
      'updatedBy': instance.updatedBy,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      docTitle: json['docTitle'] as String,
      userTags: json['userTags'] as List<dynamic>,
      docNumber: json['docNumber'] as String,
      currentSeq: json['currentSeq'] as int,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'docTitle': instance.docTitle,
      'userTags': instance.userTags,
      'docNumber': instance.docNumber,
      'currentSeq': instance.currentSeq,
    };

Version _$VersionFromJson(Map<String, dynamic> json) => Version(
      name: json['name'] as String,
      createdBy: json['createdBy'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'name': instance.name,
      'createdBy': instance.createdBy,
      'createdAt': instance.createdAt.toIso8601String(),
    };
