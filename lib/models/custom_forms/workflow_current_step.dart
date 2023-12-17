import 'dart:convert';

import 'package:chef/models/custom_forms/workflow_template_current_step.dart';

WorkflowCurrentStep workflowCurrentStepFromJson(String str) =>
    WorkflowCurrentStep.fromJson(json.decode(str));

String workflowCurrentStepToJson(WorkflowCurrentStep data) =>
    json.encode(data.toJson());

class WorkflowCurrentStep {
  factory WorkflowCurrentStep.fromJson(Map<String, dynamic> json) =>
      WorkflowCurrentStep(
        workflowId: json['workflowId'],
        templateId: json['templateId'],
        step: json['step'] == null ? null : Step.fromJson(json['step']),
        permission: json['permission'] == null
            ? null
            : Permission.fromJson(json['permission']),
      );
  WorkflowCurrentStep({
    required this.workflowId,
    required this.templateId,
    required this.step,
    required this.permission,
  });

  final String workflowId;
  final String templateId;
  final Step? step;
  final Permission? permission;

  Map<String, dynamic> toJson() => {
        'workflowId': workflowId,
        'templateId': templateId,
        'step': step?.toJson(),
        'permission': permission?.toJson(),
      };
}

class Step {
  factory Step.fromJson(Map<String, dynamic> json) => Step(
        kind: json['kind'],
        name: json['name'],
        uid: json['uid'],
        stream: json['stream'],
        assignee: json['assignee'] == null
            ? null
            : Assignee.fromJson(json['assignee']),
        form: json['form'] == null ? null : Form.fromJson(json['form']),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt']),
        active: json['active'],
        settings: json['settings'],
        actions: json['actions'] == null
            ? []
            : List<Action>.from(json['actions'].map((x) => Action.fromJson(x))),
      );
  Step({
    required this.kind,
    required this.name,
    required this.assignee,
    required this.form,
    required this.createdAt,
    required this.active,
    required this.settings,
    required this.actions,
    this.uid,
    this.stream,
  });

  final String kind;
  final String name;
  final String? uid;
  final String? stream;
  final Assignee? assignee;
  final Form? form;
  final DateTime? createdAt;
  final bool active;
  final dynamic settings;
  final List<Action> actions;

  Map<String, dynamic> toJson() => {
        'kind': kind,
        'name': name,
        'uid': uid,
        'stream': stream,
        'assignee': assignee?.toJson(),
        'form': form?.toJson(),
        'createdAt': createdAt == null ? null : createdAt!.toIso8601String(),
        'active': active,
        'settings': settings,
        'actions': List<dynamic>.from(actions.map((x) => x.toJson())),
      };
}

class Assignee {
  factory Assignee.fromJson(Map<String, dynamic> json) => Assignee(
        users: json['users'] == null
            ? []
            : List<String>.from(json['users'].map((x) => x)),
        groups: json['groups'] == null
            ? []
            : List<String>.from(json['groups'].map((x) => x)),
        dynamicUsers: json['dynamicUsers'] == null
            ? []
            : List<dynamic>.from(json['dynamicUsers'].map((x) => x)),
      );
  Assignee({
    required this.users,
    required this.groups,
    required this.dynamicUsers,
  });

  final List<String> users;
  final List<String> groups;
  final List<dynamic> dynamicUsers;

  Map<String, dynamic> toJson() => {
        'users': List<dynamic>.from(users.map((x) => x)),
        'groups': List<dynamic>.from(groups.map((x) => x)),
        'dynamicUsers': List<dynamic>.from(dynamicUsers.map((x) => x)),
      };
}
