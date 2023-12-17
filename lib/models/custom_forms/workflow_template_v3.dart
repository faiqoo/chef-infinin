import 'dart:convert';

List<WorkflowTemplate> workflowTemplateFromJson(String str) =>
    List<WorkflowTemplate>.from(
      json.decode(str).map((x) => WorkflowTemplate.fromJson(x)),
    );

String workflowTemplateToJson(List<WorkflowTemplate> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WorkflowTemplate {
  factory WorkflowTemplate.fromJson(Map<String, dynamic> json) =>
      WorkflowTemplate(
        template: Template.fromJson(json['template']),
        design: json['design'],
      );

  WorkflowTemplate({
    required this.template,
    this.design,
  });

  final Template template;
  final dynamic design;

  Map<String, dynamic> toJson() => {
        'template': template.toJson(),
        'design': design,
      };
}

class Template {
  factory Template.fromJson(Map<String, dynamic> json) => Template(
        id: json['_id'],
        version: json['version'],
        tenantId: json['tenantID'],
        name: json['name'],
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt']),
        isDeleted: json['isDeleted'] ?? false,
        baseVersion: json['baseVersion'],
        generation: json['generation'],
        migrated: json['migrated'] ?? false,
        originalData: json['originalData'] == null
            ? null
            : OriginalData.fromJson(json['originalData']),
        publishedAt: json['publishedAt'] == null
            ? null
            : DateTime.parse(json['publishedAt']),
        publishedBy: json['publishedBy'],
        module: json['module'] == null
            ? null
            : TemplateModule.fromJson(json['module']),
        v: json['__v'],
      );

  Template({
    required this.id,
    required this.version,
    required this.tenantId,
    required this.name,
    required this.isDeleted,
    required this.baseVersion,
    required this.generation,
    required this.migrated,
    this.v,
    this.originalData,
    this.publishedAt,
    this.publishedBy,
    this.module,
    this.createdAt,
    this.updatedAt,
  });

  final String id;
  final int? version;
  final String tenantId;
  final String name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isDeleted;
  final int? baseVersion;
  final String? generation;
  final bool migrated;
  final OriginalData? originalData;
  final DateTime? publishedAt;
  final dynamic publishedBy;
  final TemplateModule? module;
  final int? v;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'version': version,
        'tenantID': tenantId,
        'name': name,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        'isDeleted': isDeleted,
        'baseVersion': baseVersion,
        'generation': generation,
        'migrated': migrated,
        'originalData': originalData?.toJson(),
        'publishedAt': publishedAt?.toIso8601String(),
        'publishedBy': publishedBy,
        'module': module?.toJson(),
        '__v': v,
      };
}

class TemplateModule {
  factory TemplateModule.fromJson(Map<String, dynamic> json) => TemplateModule(
        id: json['_id'],
        name: json['name'],
        displayName: json['displayName'],
        generation: json['generation'],
      );

  TemplateModule({
    required this.id,
    required this.name,
    required this.displayName,
    required this.generation,
  });

  final String id;
  final String name;
  final String displayName;
  final String generation;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'displayName': displayName,
        'generation': generation,
      };
}

class OriginalData {
  factory OriginalData.fromJson(Map<String, dynamic> json) => OriginalData(
        id: json['_id'],
        isActive: json['isActive'],
        version: json['version'],
        isWorkflowType: json['isWorkflowType'],
        isUserDefinedWorkflow: json['isUserDefinedWorkflow'],
        isAdhocWorkflow: json['isAdhocWorkflow'],
        state: json['state'],
        customFields: json['customFields'] == null
            ? []
            : List<dynamic>.from(json['customFields'].map((x) => x)),
        customAdjustments: json['customAdjustments'] == null
            ? []
            : List<dynamic>.from(json['customAdjustments'].map((x) => x)),
        checklist: json['checklist'] == null
            ? []
            : List<dynamic>.from(json['checklist'].map((x) => x)),
        customLineItems: json['customLineItems'] == null
            ? []
            : List<dynamic>.from(json['customLineItems'].map((x) => x)),
        isCustomerLevelTemplate: json['isCustomerLevelTemplate'],
        workflowType: json['workflowType'],
        tenantId: json['tenantID'],
        name: json['name'],
        description: json['description'],
        stepTemplates: json['stepTemplates'] == null
            ? []
            : List<StepTemplate>.from(
                json['stepTemplates'].map((x) => StepTemplate.fromJson(x)),
              ),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt']),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt']),
        isDeleted: json['isDeleted'] ?? false,
        module: json['module'] == null
            ? null
            : OriginalDataModule.fromJson(json['module']),
        v: json['__v'],
      );

  OriginalData({
    required this.id,
    required this.isActive,
    required this.version,
    required this.isWorkflowType,
    required this.isUserDefinedWorkflow,
    required this.isAdhocWorkflow,
    required this.customFields,
    required this.customAdjustments,
    required this.checklist,
    required this.customLineItems,
    required this.isCustomerLevelTemplate,
    required this.workflowType,
    required this.tenantId,
    required this.name,
    required this.description,
    required this.stepTemplates,
    required this.createdAt,
    required this.updatedAt,
    required this.isDeleted,
    required this.module,
    this.v,
    this.state,
  });

  final String id;
  final bool isActive;
  final int version;
  final bool isWorkflowType;
  final bool isUserDefinedWorkflow;
  final bool isAdhocWorkflow;
  final List<dynamic> customFields;
  final List<dynamic> customAdjustments;
  final List<dynamic> checklist;
  final List<dynamic> customLineItems;
  final bool isCustomerLevelTemplate;
  final String workflowType;
  final String tenantId;
  final String name;
  final String description;
  final List<StepTemplate> stepTemplates;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool isDeleted;
  final OriginalDataModule? module;
  final int? v;
  final dynamic state;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'isActive': isActive,
        'version': version,
        'isWorkflowType': isWorkflowType,
        'isUserDefinedWorkflow': isUserDefinedWorkflow,
        'isAdhocWorkflow': isAdhocWorkflow,
        'state': state,
        'customFields': List<dynamic>.from(customFields.map((x) => x)),
        'customAdjustments':
            List<dynamic>.from(customAdjustments.map((x) => x)),
        'checklist': List<dynamic>.from(checklist.map((x) => x)),
        'customLineItems': List<dynamic>.from(customLineItems.map((x) => x)),
        'isCustomerLevelTemplate': isCustomerLevelTemplate,
        'workflowType': workflowType,
        'tenantID': tenantId,
        'name': name,
        'description': description,
        'stepTemplates':
            List<dynamic>.from(stepTemplates.map((x) => x.toJson())),
        'createdAt': createdAt == null ? null : createdAt!.toIso8601String(),
        'updatedAt': updatedAt == null ? null : updatedAt!.toIso8601String(),
        'isDeleted': isDeleted,
        'module': module == null ? null : module!.toJson(),
        '__v': v,
      };
}

class OriginalDataModule {
  factory OriginalDataModule.fromJson(Map<String, dynamic> json) =>
      OriginalDataModule(
        name: json['name'],
        generation: json['generation'],
      );

  OriginalDataModule({
    required this.name,
    required this.generation,
  });

  final String name;
  final String generation;

  Map<String, dynamic> toJson() => {
        'name': name,
        'generation': generation,
      };
}

class StepTemplate {
  factory StepTemplate.fromJson(Map<String, dynamic> json) => StepTemplate(
        fieldPermissions: json['fieldPermissions'] == null
            ? []
            : List<FieldPermission>.from(
                json['fieldPermissions']
                    .map((x) => FieldPermission.fromJson(x)),
              ),
        roleIDs: json['roleIDs'] == null
            ? []
            : List<dynamic>.from(json['roleIDs'].map((x) => x)),
        userIDs: json['userIDs'] == null
            ? []
            : List<dynamic>.from(json['userIDs'].map((x) => x)),
        conditionals: json['conditionals'] == null
            ? []
            : List<dynamic>.from(json['conditionals'].map((x) => x)),
        id: json['_id'],
        name: json['name'],
        formRefId: json['formRefID'],
        stepNumber: json['stepNumber'],
        destinationStepNumber: json['destinationStepNumber'],
      );

  StepTemplate({
    required this.fieldPermissions,
    required this.roleIDs,
    required this.userIDs,
    required this.conditionals,
    required this.id,
    required this.name,
    required this.stepNumber,
    required this.destinationStepNumber,
    this.formRefId,
  });

  final List<FieldPermission> fieldPermissions;
  final List<dynamic> roleIDs;
  final List<dynamic> userIDs;
  final List<dynamic> conditionals;
  final String id;
  final String name;
  final String? formRefId;
  final int stepNumber;
  final int destinationStepNumber;

  Map<String, dynamic> toJson() => {
        'fieldPermissions':
            List<dynamic>.from(fieldPermissions.map((x) => x.toJson())),
        'roleIDs': List<dynamic>.from(roleIDs.map((x) => x)),
        'userIDs': List<dynamic>.from(userIDs.map((x) => x)),
        'conditionals': List<dynamic>.from(conditionals.map((x) => x)),
        '_id': id,
        'name': name,
        'formRefID': formRefId,
        'stepNumber': stepNumber,
        'destinationStepNumber': destinationStepNumber,
      };
}

class FieldPermission {
  factory FieldPermission.fromJson(Map<String, dynamic> json) =>
      FieldPermission(
        field: json['field'],
        view: json['view'] ?? false,
        edit: json['edit'] ?? false,
        mobile: json['mobile'] ?? false,
      );

  FieldPermission({
    required this.field,
    required this.view,
    required this.edit,
    required this.mobile,
  });

  final String field;
  final bool view;
  final bool edit;
  final bool mobile;

  Map<String, dynamic> toJson() => {
        'field': field,
        'view': view,
        'edit': edit,
        'mobile': mobile,
      };
}
