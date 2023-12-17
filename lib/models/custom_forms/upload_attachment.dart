import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_attachment.g.dart';

@JsonSerializable(explicitToJson: true)
class UploadAttachment {
  UploadAttachment({
    required this.message,
    required this.data,
  });

  factory UploadAttachment.fromJson(Map<String, dynamic> json) =>
      _$UploadAttachmentFromJson(json);

  Map<String, dynamic> toJson() => _$UploadAttachmentToJson(this);

  final String message;
  final Data data;
}

@JsonSerializable(explicitToJson: true)
class Data {
  Data({
    required this.documentId,
    required this.locationPath,
    required this.fileName,
    required this.fileSize,
    required this.meta,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  final String documentId;
  final String locationPath;
  final String fileName;
  final int fileSize;
  final Meta meta;
}

@JsonSerializable()
class Meta {
  Meta({
    required this.docTitle,
    required this.docNumber,
    required this.currentSeq,
    required this.userTags,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);

  final String docTitle;
  final String docNumber;
  final int currentSeq;
  final List<dynamic> userTags;
}
