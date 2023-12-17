import 'dart:convert';

WorkflowTemplateCurrentStep workflowTemplateCurrentStepFromJson(String str) =>
    WorkflowTemplateCurrentStep.fromJson(json.decode(str));

String workflowTemplateCurrentStepToJson(WorkflowTemplateCurrentStep data) =>
    json.encode(data.toJson());

class WorkflowTemplateCurrentStep {
  factory WorkflowTemplateCurrentStep.fromJson(Map<String, dynamic> json) =>
      WorkflowTemplateCurrentStep(
        templateId: json['templateId'],
        step: json['step'] == null ? null : Step.fromJson(json['step']),
        permission: json['permission'] == null
            ? null
            : Permission.fromJson(json['permission']),
      );
  WorkflowTemplateCurrentStep({
    required this.templateId,
    required this.step,
    required this.permission,
  });

  final String templateId;
  final Step? step;
  final Permission? permission;

  Map<String, dynamic> toJson() => {
        'templateId': templateId,
        'step': step?.toJson(),
        'permission': permission?.toJson(),
      };
}

class Permission {
  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        create: json['create'] ?? false,
        submit: json['submit'] ?? false,
        edit: json['edit'] ?? false,
        withdraw: json['withdraw'] ?? false,
      );
  Permission({
    required this.create,
    required this.submit,
    required this.edit,
    required this.withdraw,
  });

  final bool create;
  final bool submit;
  final bool edit;
  final bool withdraw;

  Map<String, dynamic> toJson() => {
        'create': create,
        'submit': submit,
        'edit': edit,
        'withdraw': withdraw,
      };
}

class Step {
  factory Step.fromJson(Map<String, dynamic> json) => Step(
        uid: json['uid'],
        kind: json['kind'],
        name: json['name'],
        stream: json['stream'],
        actions:
            List<Action>.from(json['actions'].map((x) => Action.fromJson(x))),
        form: json['form'] == null ? null : Form.fromJson(json['form']),
        settings: json['settings'],
        condition: json['condition'],
      );
  Step({
    required this.uid,
    required this.kind,
    required this.name,
    required this.stream,
    required this.actions,
    required this.form,
    required this.settings,
    required this.condition,
  });

  final String? uid;
  final String kind;
  final String name;
  final String stream;
  final List<Action> actions;
  final Form? form;
  final dynamic settings;
  final dynamic condition;

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'kind': kind,
        'name': name,
        'stream': stream,
        'actions': List<dynamic>.from(actions.map((x) => x.toJson())),
        'form': form?.toJson(),
        'settings': settings,
        'condition': condition,
      };
}

class Action {
  factory Action.fromJson(Map<String, dynamic> json) => Action(
        name: json['name'],
        status: json['status'],
        nextStepName: json['nextStepName'],
        settings: json['settings'],
      );
  Action({
    required this.name,
    required this.status,
    required this.nextStepName,
    required this.settings,
  });

  final String name;
  final String status;
  final String nextStepName;
  final dynamic settings;

  Map<String, dynamic> toJson() => {
        'name': name,
        'status': status,
        'nextStepName': nextStepName,
        'settings': settings,
      };
}

class Form {
  factory Form.fromJson(Map<String, dynamic> json) => Form(
        webFormId: json['webFormId'],
        mobileFormId: json['mobileFormId'],
      );
  Form({
    required this.webFormId,
    required this.mobileFormId,
  });

  final String webFormId;
  final String? mobileFormId;

  Map<String, dynamic> toJson() => {
        'webFormId': webFormId,
        'mobileFormId': mobileFormId,
      };
}
