import 'package:chef/models/custom_forms/record.dart';
import 'package:chef/models/custom_forms/workflow_template_current_step.dart';

class Workflow {
  Workflow({
    required this.moduleName,
    required this.actionName,
    required this.comment,
    required this.space,
    this.assignee,
    this.currentStepName,
    this.documentIds,
    this.moduleRecord = const {},
    this.templateId,
    this.workflowId,
    this.createPermission,
    this.editPermission,
    this.actions,
    this.formRefId,
    this.formId,
    this.record,
    this.active,
    this.migrated,
  });

  factory Workflow.empty() => Workflow(
        moduleName: '',
        actionName: '',
        comment: Comment.empty(),
        documentIds: [],
        space: Space.empty(),
        record: const Record(),
      );

  factory Workflow.fromJson(Map<String, dynamic> json) => Workflow(
        moduleName: json['moduleName'] ?? '',
        actionName: json['actionName'],
        assignee: json['assignee'] == null
            ? Assignee.empty()
            : Assignee.fromJson(json['assignee']),
        comment: json['comment'] == null
            ? Comment.empty()
            : Comment.fromJson(json['comment']),
        currentStepName: json['currentStepName'],
        documentIds: json['documentIds'] == null
            ? []
            : List<String>.from(json['documentIds'].map((x) => x)),
        moduleRecord: json['moduleRecord'] ?? {},
        space: json['space'] == null
            ? Space.empty()
            : Space.fromJson(json['space']),
        workflowId: json['workflowId'],
        active: json['active'] ?? true,
        migrated: json['migrated'] ?? false,
      );

  final String moduleName;
  final String actionName;
  final Comment comment;
  final Space space;
  final List<String>? documentIds;
  final Assignee? assignee;
  final String? currentStepName;
  final Map<String, dynamic> moduleRecord;
  final String? templateId;
  final String? workflowId;
  final Permission? createPermission;
  final Permission? editPermission;
  final List<Action>? actions;
  final String? formRefId;
  final String? formId;
  final Record? record;
  final bool? active;
  final bool? migrated;

  Map<String, dynamic> toJson({
    required bool isInEdit,
    String? actionName,
    String? recordId,
    String? workflowId,
    String? currentStepName,
    String? formRefId,
    bool saveAsDraft = false,
    bool isWorkflowsEmpty = false,
  }) {
    final _checkList = moduleRecord[recordId]?['checklist'];
    if (moduleRecord['checklist'] == null) {
      moduleRecord[recordId]?.remove('checklist');
    }

    final _moduleRecord = {
      '_id': isInEdit ? recordId! : null,
      'formData': isInEdit ? moduleRecord[recordId] : moduleRecord,
      'checklistData': moduleRecord[recordId] != null
          ? List<dynamic>.from(
              moduleRecord['checkList']?.map((x) => x.toJson()) ?? [],
            )
          : List<dynamic>.from(
              _checkList?.map((x) => x.toJson()) ?? [],
            ),
      'subTableData': isInEdit
          ? moduleRecord[recordId]['subTableData']
          : moduleRecord['subTableData'] ?? {},
      'customFieldAdjustments': [],
      'customLineItems': [],
    };

    final _data = <String, dynamic>{};
    if (formRefId != null) {
      _data['formRefId'] = formRefId;
    }
    if (actionName != null) {
      _data['actionName'] = actionName;
    }
    _data['assignee'] = assignee?.toJson();
    _data['comment'] = comment.toJson();
    _data['documentIds'] = documentIds == null
        ? null
        : List<dynamic>.from(documentIds!.map((x) => x));
    _data['space'] = space.toJson();
    if (!saveAsDraft) {
      _data['moduleRecord'] = _moduleRecord;
    } else {
      _data['moduleData'] = _moduleRecord;
      _data['workflowTemplateId'] = templateId;
    }
    if (isWorkflowsEmpty) {
      _data['templateId'] = templateId;
    } else {
      _data['workflowId'] = workflowId;
      _data['currentStepName'] = currentStepName ?? '';
    }
    _data['active'] = active;

    return _data;
  }

  Workflow copyWith({
    String? moduleName,
    String? actionName,
    Assignee? assignee,
    Comment? comment,
    String? currentStepName,
    List<String>? documentIds,
    Map<String, dynamic>? moduleRecord,
    Space? space,
    String? templateId,
    String? workflowId,
    Permission? createPermission,
    Permission? editPermission,
    List<Action>? actions,
    String? formRefId,
    String? formId,
    Record? record,
    bool? active,
    bool? migrated,
  }) =>
      Workflow(
        moduleName: moduleName ?? this.moduleName,
        actionName: actionName ?? this.actionName,
        assignee: assignee ?? this.assignee,
        comment: comment ?? this.comment,
        currentStepName: currentStepName ?? this.currentStepName,
        documentIds: documentIds ?? this.documentIds,
        moduleRecord: moduleRecord ?? this.moduleRecord,
        space: space ?? this.space,
        templateId: templateId ?? this.templateId,
        workflowId: workflowId ?? this.workflowId,
        createPermission: createPermission ?? this.createPermission,
        editPermission: editPermission ?? this.editPermission,
        actions: actions ?? this.actions,
        formRefId: formRefId ?? this.formRefId,
        formId: formId ?? this.formId,
        record: record ?? this.record,
        active: active ?? this.active,
        migrated: migrated ?? this.migrated,
      );
}

class Assignee {
  factory Assignee.fromJson(Map<String, dynamic> json) => Assignee(
        users: json['users'] == null
            ? []
            : List<String>.from(json['users'].map((x) => x)),
        groups: json['groups'] == null
            ? []
            : List<String>.from(json['groups'].map((x) => x)),
      );

  factory Assignee.empty() => Assignee(
        users: [],
        groups: [],
      );

  Assignee({
    required this.users,
    required this.groups,
  });

  final List<String> users;
  final List<String> groups;

  Map<String, dynamic> toJson() => {
        'users': List<dynamic>.from(users.map((x) => x)),
        'groups': List<dynamic>.from(groups.map((x) => x)),
      };
}

class Comment {
  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        text: json['text'] ?? '',
        isPrivate: json['isPrivate'] ?? true,
      );

  factory Comment.empty() => Comment(text: '', isPrivate: true);

  Comment({
    required this.text,
    required this.isPrivate,
  });

  final String text;
  final bool isPrivate;

  Map<String, dynamic> toJson() => {
        'text': text,
        'isPrivate': isPrivate,
      };
}

class Space {
  factory Space.fromJson(Map<String, dynamic> json) => Space(
        name: json['name'] ?? '',
        refId: json['refId'] ?? '',
      );

  factory Space.empty() => Space(name: '', refId: '');

  Space({
    required this.name,
    required this.refId,
  });

  final String name;
  final String refId;

  Map<String, dynamic> toJson() => {
        'name': name,
        'refId': refId,
      };
}
