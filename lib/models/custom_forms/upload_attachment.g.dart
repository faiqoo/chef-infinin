// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_attachment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadAttachment _$UploadAttachmentFromJson(Map<String, dynamic> json) =>
    UploadAttachment(
      message: json['message'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadAttachmentToJson(UploadAttachment instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data.toJson(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      documentId: json['documentId'] as String,
      locationPath: json['locationPath'] as String,
      fileName: json['fileName'] as String,
      fileSize: json['fileSize'] as int,
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'locationPath': instance.locationPath,
      'fileName': instance.fileName,
      'fileSize': instance.fileSize,
      'meta': instance.meta.toJson(),
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      docTitle: json['docTitle'] as String,
      docNumber: json['docNumber'] as String,
      currentSeq: json['currentSeq'] as int,
      userTags: json['userTags'] as List<dynamic>,
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'docTitle': instance.docTitle,
      'docNumber': instance.docNumber,
      'currentSeq': instance.currentSeq,
      'userTags': instance.userTags,
    };
