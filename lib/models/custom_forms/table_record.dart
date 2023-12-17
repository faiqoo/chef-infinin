import 'dart:convert';

TableRecord tableRecordFromJson(String str) =>
    TableRecord.fromJson(json.decode(str));

String tableRecordToJson(TableRecord data) => json.encode(data.toJson());

class TableRecord {
  factory TableRecord.fromJson(Map<String, dynamic> json) => TableRecord(
        id: json['_id'],
        seqNumber: json['seqNumber'],
        recordNumber: json['recordNumber'],
        tenantId: json['tenantID'],
        projectId: json['projectID'],
        workspaceRefId: json['workspaceRefId'],
        refId: json['refID'],
        createdBy: json['createdBy'],
        updatedBy: json['updatedBy'],
        isDeleted: json['isDeleted'],
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt']),
        workflowTemplateId: json['workflowTemplateID'],
        v: json['__v'],
        bpname: json['bpname'],
        status: json['status'],
        workflowInstanceId: json['workflowInstanceID'],
        subtableData: json['subTableData'] ?? {},
      );
  TableRecord({
    this.id,
    this.seqNumber,
    this.recordNumber,
    this.tenantId,
    this.projectId,
    this.workspaceRefId,
    this.customLineItems,
    this.checklist,
    this.refId,
    this.createdBy,
    this.updatedBy,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.workflowTemplateId,
    this.v,
    this.bpname,
    this.status,
    this.workflowInstanceId,
    this.subtableData,
  });

  String? id;
  int? seqNumber;
  String? recordNumber;
  String? tenantId;
  String? projectId;
  String? workspaceRefId;
  List<dynamic>? customLineItems;
  List<dynamic>? checklist;
  String? refId;
  String? createdBy;
  String? updatedBy;
  bool? isDeleted;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? workflowTemplateId;
  int? v;
  String? bpname;
  String? status;
  String? workflowInstanceId;
  final Map<dynamic, dynamic>? subtableData;
  Map<String, dynamic> toJson() => {
        '_id': id,
        'seqNumber': seqNumber,
        'recordNumber': recordNumber,
        'tenantID': tenantId,
        'projectID': projectId,
        'workspaceRefId': workspaceRefId,
        'customLineItems': customLineItems == null
            ? null
            : List<dynamic>.from(customLineItems!.map((x) => x)),
        'checklist': checklist == null
            ? null
            : List<dynamic>.from(checklist!.map((x) => x)),
        'refID': refId,
        'createdBy': createdBy,
        'updatedBy': updatedBy,
        'isDeleted': isDeleted,
        'createdAt': createdAt == null ? null : createdAt!.toIso8601String(),
        'updatedAt': updatedAt == null ? null : updatedAt!.toIso8601String(),
        'workflowTemplateID': workflowTemplateId,
        '__v': v,
        'bpname': bpname,
        'status': status,
        'workflowInstanceID': workflowInstanceId,
        'subTableData': subtableData,
      };
}
