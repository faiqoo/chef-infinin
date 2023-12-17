import 'package:equatable/equatable.dart';
import 'package:chef/models/custom_forms/workflow_current_step.dart';

class Record extends Equatable {
  const Record({
    this.sId,
    this.createdBy,
    this.updatedBy,
    this.isDeleted,
    this.seqNumber,
    this.recordNumber,
    this.checklist,
    this.refID,
    this.customFields,
    this.space,
    this.customLineItems,
    this.createdAt,
    this.updatedAt,
    this.workflowTemplateID,
    this.tenantID,
    this.projectID,
    this.iV,
    this.bpname,
    this.status,
    this.subTableData,
    this.workflowInstanceID,
    this.isLocal,
    this.recordData,
    this.workflowId,
    this.workflow,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    var checklistRecords = [];
    var customLineItemsRecords = [];

    if (json['customLineItems'] != null) {
      json['customLineItems'].forEach((v) {
        customLineItemsRecords.add(v);
      });
    }
    if (json['checklist'] != null) {
      json['checklist'].forEach((v) {
        checklistRecords.add(v);
      });
    }
    return Record(
      sId: json['_id'],
      createdBy: json['createdBy'],
      updatedBy: json['updatedBy'],
      isDeleted: json['isDeleted'],
      seqNumber: json['seqNumber'],
      recordNumber: json['recordNumber'],
      checklist: checklistRecords,
      customLineItems: customLineItemsRecords,
      refID: json['refID'],
      customFields: json['customFields'],
      space: json['space'] != null ? Space.fromJson(json['space']) : null,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      workflowTemplateID: json['workflowTemplateID'],
      tenantID: json['tenantID'],
      projectID: json['projectID'],
      iV: json['__v'],
      bpname: json['bpname'],
      status: json['status'],
      subTableData: json['subTableData'] ?? {},
      workflowInstanceID: json['workflowInstanceID'],
      isLocal: json['isLocal'] ?? false,
      recordData: json['recordData'] ?? {},
      workflowId: json['workflowId'],
      workflow: json['workflow'] == null
          ? []
          : List<Workflow>.from(
              json['workflow'].map((x) => Workflow.fromJson(x)),
            ),
    );
  }

  final String? sId;
  final String? createdBy;
  final String? updatedBy;
  final bool? isDeleted;
  final int? seqNumber;
  final String? recordNumber;
  final List<dynamic>? checklist;
  final String? refID;
  final Map<String, dynamic>? customFields;
  final Space? space;
  final List<dynamic>? customLineItems;
  final String? createdAt;
  final String? updatedAt;
  final String? workflowTemplateID;
  final String? tenantID;
  final String? projectID;
  final int? iV;
  final String? bpname;
  final String? status;
  final Map<String, dynamic>? subTableData;
  final String? workflowInstanceID;
  final bool? isLocal;
  final Map<String, dynamic>? recordData;
  final String? workflowId;
  final List<Workflow>? workflow;

  @override
  List<Object?> get props => [sId];
}

class Workflow {
  factory Workflow.fromJson(Map<String, dynamic> json) => Workflow(
        id: json['_id'],
        tenantId: json['tenantID'],
        slug: json['slug'],
        createdBy: json['createdBy'],
        isDeleted: json['isDeleted'],
        templateId: json['templateId'],
        moduleId: json['moduleId'],
        recordId: json['recordId'],
        participants: json['participants'] == null
            ? []
            : List<Participant>.from(
                json['participants'].map((x) => Participant.fromJson(x)),
              ),
        additionalUsers: json['additionalUsers'] == null
            ? []
            : List<dynamic>.from(json['additionalUsers'].map((x) => x)),
        currentCycle: json['currentCycle'],
        active: json['active'],
        steps: json['steps'] == null
            ? []
            : List<Step>.from(json['steps'].map((x) => Step.fromJson(x))),
        firstStepName: json['firstStepName'],
        dynamicUser: json['dynamicUser'] == null
            ? DynamicUser.empty()
            : DynamicUser.fromJson(json['dynamicUser']),
        status: json['status'],
        projectId: json['projectID'],
        workspaceRefId: json['workspaceRefId'],
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt']),
        v: json['__v'],
        updatedBy: json['updatedBy'],
        ballInCourt: json['ballInCourt'] == null
            ? []
            : List<String>.from(json['ballInCourt'].map((x) => x)),
      );
  Workflow({
    required this.id,
    required this.tenantId,
    required this.slug,
    required this.createdBy,
    required this.isDeleted,
    required this.templateId,
    required this.moduleId,
    required this.recordId,
    required this.participants,
    required this.additionalUsers,
    required this.currentCycle,
    required this.active,
    required this.steps,
    required this.firstStepName,
    required this.dynamicUser,
    required this.status,
    required this.projectId,
    required this.workspaceRefId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.updatedBy,
    required this.ballInCourt,
  });

  final String id;
  final String tenantId;
  final String slug;
  final String? createdBy;
  final bool isDeleted;
  final String? templateId;
  final String moduleId;
  final String recordId;
  final List<Participant>? participants;
  final List<dynamic>? additionalUsers;
  final int? currentCycle;
  final bool active;
  final List<Step>? steps;
  final String? firstStepName;
  final DynamicUser? dynamicUser;
  final String? status;
  final String? projectId;
  final String? workspaceRefId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int v;
  final String? updatedBy;
  final List<String>? ballInCourt;

  Workflow copyWith({
    String? id,
    String? tenantId,
    String? slug,
    String? createdBy,
    bool? isDeleted,
    String? templateId,
    String? moduleId,
    String? recordId,
    List<Participant>? participants,
    List<dynamic>? additionalUsers,
    int? currentCycle,
    bool? active,
    List<Step>? steps,
    String? firstStepName,
    DynamicUser? dynamicUser,
    String? status,
    String? projectId,
    String? workspaceRefId,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? updatedBy,
    List<String>? ballInCourt,
  }) =>
      Workflow(
        id: id ?? this.id,
        tenantId: tenantId ?? this.tenantId,
        slug: slug ?? this.slug,
        createdBy: createdBy ?? this.createdBy,
        isDeleted: isDeleted ?? this.isDeleted,
        templateId: templateId ?? this.templateId,
        moduleId: moduleId ?? this.moduleId,
        recordId: recordId ?? this.recordId,
        participants: participants ?? this.participants,
        additionalUsers: additionalUsers ?? this.additionalUsers,
        currentCycle: currentCycle ?? this.currentCycle,
        active: active ?? this.active,
        steps: steps ?? this.steps,
        firstStepName: firstStepName ?? this.firstStepName,
        dynamicUser: dynamicUser ?? this.dynamicUser,
        status: status ?? this.status,
        projectId: projectId ?? this.projectId,
        workspaceRefId: workspaceRefId ?? this.workspaceRefId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        v: v ?? this.v,
        updatedBy: updatedBy ?? this.updatedBy,
        ballInCourt: ballInCourt ?? this.ballInCourt,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'tenantID': tenantId,
        'slug': slug,
        'createdBy': createdBy,
        'isDeleted': isDeleted,
        'templateId': templateId,
        'moduleId': moduleId,
        'recordId': recordId,
        'participants': participants == null
            ? []
            : List<dynamic>.from(participants!.map((x) => x.toJson())),
        'additionalUsers': additionalUsers == null
            ? []
            : List<dynamic>.from(additionalUsers!.map((x) => x)),
        'currentCycle': currentCycle,
        'active': active,
        'steps': steps == null
            ? []
            : List<dynamic>.from(steps!.map((x) => x.toJson())),
        'firstStepName': firstStepName,
        'dynamicUser': dynamicUser?.toJson(),
        'status': status,
        'projectID': projectId,
        'workspaceRefId': workspaceRefId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
        'updatedBy': updatedBy,
        'ballInCourt': ballInCourt == null
            ? []
            : List<dynamic>.from(ballInCourt!.map((x) => x)),
      };
}

class DynamicUser {
  factory DynamicUser.fromJson(Map<String, dynamic> json) => DynamicUser(
        creator: json['Creator'],
        previousUser: json['PreviousUser'],
      );
  DynamicUser({
    required this.creator,
    required this.previousUser,
  });

  factory DynamicUser.empty() => DynamicUser(creator: '', previousUser: '');

  final String creator;
  final String previousUser;

  DynamicUser copyWith({
    String? creator,
    String? previousUser,
  }) =>
      DynamicUser(
        creator: creator ?? this.creator,
        previousUser: previousUser ?? this.previousUser,
      );

  Map<String, dynamic> toJson() => {
        'Creator': creator,
        'PreviousUser': previousUser,
      };
}

class Participant {
  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
        user: json['user'],
        stream: json['stream'],
      );
  Participant({
    required this.user,
    required this.stream,
  });

  final String user;
  final String stream;

  Participant copyWith({
    String? user,
    String? stream,
  }) =>
      Participant(
        user: user ?? this.user,
        stream: stream ?? this.stream,
      );

  Map<String, dynamic> toJson() => {
        'user': user,
        'stream': stream,
      };
}

class Space extends Equatable {
  const Space({
    this.name,
    this.refID,
  });

  factory Space.fromJson(Map<String, dynamic> json) => Space(
        name: json['name'],
        refID: json['refID'],
      );
  final String? name;
  final String? refID;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['refID'] = refID;
    return data;
  }

  @override
  List<Object?> get props => [refID];
}

class RecordDetails extends Equatable {
  const RecordDetails({
    required this.sId,
    required this.meta,
    required this.currentCycle,
    required this.ballInCourt,
    required this.isDeleted,
    required this.status,
    required this.stepInstances,
    required this.workflowType,
    required this.templateObjectID,
    required this.totalWorkflowSteps,
    required this.updatedAt,
    required this.createdAt,
    required this.iV,
  });

  factory RecordDetails.fromJson(Map<String, dynamic> json) {
    var ballInCourtRecords = [];
    var stepInstancesRecords = <StepInstances>[];

    if (json['ballInCourt'] != null) {
      json['ballInCourt'].forEach((v) {
        ballInCourtRecords.add(v);
      });
    }
    if (json['stepInstances'] != null) {
      json['stepInstances'].forEach((v) {
        stepInstancesRecords.add(StepInstances.fromJson(v));
      });
    }

    return RecordDetails(
      sId: json['_id'],
      meta: json['meta'] != null ? Meta.fromJson(json['meta']) : null,
      currentCycle: json['currentCycle'],
      isDeleted: json['isDeleted'],
      status: json['status'],
      ballInCourt: ballInCourtRecords,
      stepInstances: stepInstancesRecords,
      workflowType: json['workflowType'],
      templateObjectID: json['templateObjectID'],
      totalWorkflowSteps: json['totalWorkflowSteps'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
      iV: json['__v'],
    );
  }

  final String? sId;
  final Meta? meta;
  final int? currentCycle;
  final List<dynamic>? ballInCourt;
  final bool? isDeleted;
  final String? status;
  final List<StepInstances>? stepInstances;
  final String? workflowType;
  final String? templateObjectID;
  final int? totalWorkflowSteps;
  final String? updatedAt;
  final String? createdAt;
  final int? iV;

  @override
  List<Object?> get props => [sId];
}

class Meta extends Equatable {
  const Meta({
    required this.projectID,
    required this.revision,
    required this.date,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        projectID: json['projectID'],
        revision: json['revision'],
        date: json['date'],
      );

  final String? projectID;
  final int? revision;
  final String? date;

  @override
  List<Object?> get props => [projectID];
}

class StepInstances extends Equatable {
  const StepInstances({
    required this.documents,
    required this.stepNumber,
    required this.status,
    required this.cycle,
    required this.userID,
    required this.stepName,
    required this.comment,
    required this.updatedDate,
  });

  factory StepInstances.fromJson(Map<String, dynamic> json) {
    var documentsRecords = [];
    if (json['documents'] != null) {
      json['documents'].forEach((v) {
        documentsRecords.add(v);
      });
    }

    return StepInstances(
      stepNumber: json['stepNumber'],
      documents: documentsRecords,
      status: json['status'],
      cycle: json['cycle'],
      userID: json['userID'],
      stepName: json['stepName'],
      comment: json['comment'],
      updatedDate: json['updatedDate'],
    );
  }

  final List<dynamic>? documents;
  final int? stepNumber;
  final String? status;
  final int? cycle;
  final String? userID;
  final String? stepName;
  final String? comment;
  final String? updatedDate;

  @override
  List<Object?> get props => [userID];
}
