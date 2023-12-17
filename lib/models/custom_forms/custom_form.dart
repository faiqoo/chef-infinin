import 'package:equatable/equatable.dart';

class CustomForm {
  CustomForm({
    required this.ok,
    required this.success,
    required this.data,
  });

  factory CustomForm.fromJson(Map<String, dynamic> json) {
    return CustomForm(
      ok: json['ok'],
      success: json['success'],
      data: json['data'] != null ? CustomFormData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tempData = <String, dynamic>{};
    tempData['ok'] = ok;
    tempData['success'] = success;
    if (data != null) {
      tempData['data'] = data!.toJson();
    }
    return tempData;
  }

  bool ok;
  bool success;
  CustomFormData? data;
}

class CustomFormDataResponse extends Equatable {
  const CustomFormDataResponse({required this.forms});

  factory CustomFormDataResponse.fromJson(List<dynamic> json) {
    final forms = <CustomFormData>[];
    for (var jsonElement in json) {
      forms.add(CustomFormData.fromJson(jsonElement));
    }
    return CustomFormDataResponse(forms: forms);
  }
  final List<CustomFormData> forms;

  @override
  List<Object?> get props => [forms];
}

class CustomFormData extends Equatable {
  const CustomFormData({
    required this.sId,
    required this.isActive,
    required this.fields,
    required this.rules,
    required this.name,
    required this.table,
    required this.createdBy,
    required this.tenantID,
    required this.moduleName,
    required this.refID,
    required this.createdAt,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory CustomFormData.fromJson(Map<String, dynamic> json) {
    var rules = <Rules>[];
    if (json['rules'] != null) {
      json['rules'].forEach((v) {
        rules.add(Rules.fromJson(v));
      });
    }
    final fields = <Fields>[];
    if (json['fields'] != null) {
      json['fields'].forEach((v) {
        fields.add(Fields.fromJson(v));
      });
    }
    return CustomFormData(
      sId: json['_id'] ?? '',
      isActive: json['isActive'] ?? false,
      name: json['name'] ?? '',
      table:
          json['table'] != null ? TableExtoField.fromJson(json['table']) : null,
      createdBy: json['createdBy'] ?? '',
      tenantID: json['tenantID'] ?? '',
      moduleName: json['moduleName'] ?? '',
      refID: json['refID'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      updatedBy: json['updatedBy'] ?? '',
      rules: rules,
      fields: fields,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['isActive'] = isActive;
    if (fields != null) {
      data['fields'] = fields!.map((v) => v.toJson()).toList();
    }
    if (rules != null) {
      data['rules'] = rules!.map((v) => v.toJson()).toList();
    }
    data['name'] = name;
    if (table != null) {
      data['table'] = table!.toJson();
    }
    data['createdBy'] = createdBy;
    data['tenantID'] = tenantID;
    data['moduleName'] = moduleName;
    data['refID'] = refID;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['updatedBy'] = updatedBy;
    return data;
  }

  final String sId;
  final bool isActive;
  final List<Fields>? fields;
  final List<Rules>? rules;
  final String name;
  final TableExtoField? table;
  final String createdBy;
  final String tenantID;
  final String moduleName;
  final String refID;
  final String createdAt;
  final String updatedAt;
  final String updatedBy;

  @override
  List<Object?> get props => [sId];
}

class Fields {
  Fields({
    required this.type,
    required this.properties,
    required this.children,
  });

  factory Fields.fromJson(Map<String, dynamic> json) {
    final children = <Fields>[];
    if (json['children'] != null) {
      json['children'].forEach((v) {
        children.add(Fields.fromJson(v));
      });
    }
    return Fields(
      type: json['type'],
      properties: json['props'] != null
          ? FieldProperties.fromJson(json['props'])
          : null,
      children: children,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    if (properties != null) {
      data['props'] = properties!.toJson();
    }
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String type;
  FieldProperties? properties;
  List<Fields>? children;
}

class FieldProperties {
  FieldProperties({
    required this.label,
    required this.content,
    required this.size,
    required this.style,
    required this.height,
    required this.isMandatory,
    required this.isMultiSelect,
    required this.isSearchable,
    required this.inputType,
    required this.id,
    required this.name,
    required this.dataSetId,
    required this.dataSourceId,
    required this.optField,
    required this.shortDescription,
    required this.isReadOnly,
    required this.hideLabel,
    required this.direction,
    required this.isHidden,
    required this.helpText,
    required this.title,
    required this.count,
    required this.layout,
    required this.alignment,
    required this.checkListId,
    required this.rowCount,
    required this.tableId,
    required this.formId,
    required this.columns,
    required this.extField,
  });

  factory FieldProperties.fromJson(Map<String, dynamic> json) {
    final alignments = <FieldAlignment>[];
    if (json['alignment'] != null) {
      json['alignment'].forEach((v) {
        alignments.add(FieldAlignment.fromJson(v));
      });
    }
    final columns = <Columns>[];
    if (json['columns'] != null) {
      json['columns'].forEach((v) {
        columns.add(Columns.fromJson(v));
      });
    }
    return FieldProperties(
      label: json['label'] ?? '',
      content: json['content'] ?? '',
      size: json['size'] ?? 'SMALL',
      style: json['style'] ?? {},
      height: json['height'] ?? '',
      dataSetId: json['dataSetId'] ?? '',
      dataSourceId: json['dataSourceId'] ?? '',
      optField:
          json['optField'] != null ? OptField.fromJson(json['optField']) : null,
      isMandatory: json['mandatory'] ?? true,
      isSearchable: json['search'] ?? false,
      isMultiSelect: json['multiSelect'] ?? false,
      inputType: json['inputType'] ?? '',
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      shortDescription: json['shortDesc'] ?? '',
      direction: json['direction'] ?? '',
      isReadOnly: json['readOnly'] ?? false,
      hideLabel: json['hideLabel'] ?? false,
      isHidden: json['hidden'] ?? false,
      helpText: json['helpText'] ?? '',
      title: json['title'] ?? '',
      count: json['count'] ?? 0,
      rowCount: json['rowCount'] ?? 0,
      layout: json['layout'] ?? '',
      alignment: alignments,
      checkListId: json['checkListID'] ?? '',
      formId: json['formID'] ?? '',
      tableId: json['tableID'] ?? '',
      extField:
          json['extField'] != null ? ExtField.fromJson(json['extField']) : null,
      columns: columns,
    );
  }

  final String label;
  final String content;
  final String size;
  final String height;
  final Map<String, dynamic> style;
  final bool isMandatory;
  final bool isSearchable;
  final bool isMultiSelect;
  final String inputType;
  final String id;
  final String name;
  final String dataSetId;
  final String dataSourceId;
  final OptField? optField;
  final String direction;
  final String shortDescription;
  final bool isReadOnly;
  final bool hideLabel;
  final String helpText;
  final String title;
  final int count;
  final String layout;
  final bool isHidden;
  final List<FieldAlignment>? alignment;
  final String checkListId;
  final int rowCount;
  final String tableId;
  final String formId;
  final List<Columns> columns;
  final ExtField? extField;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['label'] = label;
    data['content'] = content;
    data['size'] = size;
    data['style'] = style;
    data['height'] = height;
    data['mandatory'] = isMandatory;
    data['search'] = isSearchable;
    data['multiSelect'] = isSearchable;
    data['inputType'] = inputType;
    data['id'] = id;
    data['name'] = name;
    data['dataSourceId'] = dataSourceId;
    data['optField'] = optField!.toJson();
    data['shortDesc'] = shortDescription;
    data['readOnly'] = isReadOnly;
    data['hideLabel'] = hideLabel;
    data['helpText'] = helpText;
    data['title'] = title;
    data['direction'] = direction;
    data['count'] = count;
    data['hidden'] = isHidden;
    data['layout'] = layout;
    data['extField'] = extField?.toJson();

    if (alignment != null) {
      data['alignment'] = alignment!.map((v) => v.toJson()).toList();
    }
    data['checkListID'] = checkListId;
    return data;
  }
}

class OptField {
  factory OptField.fromJson(Map<String, dynamic> json) => OptField(
        label: LabelAutoComplete.fromJson(json['label']),
        value: LabelAutoComplete.fromJson(json['value']),
      );
  OptField({
    this.label,
    this.value,
  });

  LabelAutoComplete? label;
  LabelAutoComplete? value;

  Map<String, dynamic> toJson() => {
        'label': label?.toJson(),
        'value': value?.toJson(),
      };
}

class LabelAutoComplete {
  factory LabelAutoComplete.fromJson(Map<String, dynamic> json) =>
      LabelAutoComplete(
        label: json['label'],
        name: json['name'],
        type: json['type'],
      );
  LabelAutoComplete({
    this.label,
    this.name,
    this.type,
  });

  String? label;
  String? name;
  String? type;

  Map<String, dynamic> toJson() => {
        'label': label,
        'name': name,
        'type': type,
      };
}

class FieldAlignment {
  FieldAlignment({
    required this.horiz,
    required this.vertz,
  });

  factory FieldAlignment.fromJson(Map<String, dynamic> json) {
    return FieldAlignment(
      horiz: json['horiz'] ?? '',
      vertz: json['vertz'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['horiz'] = horiz;
    data['vertz'] = vertz;
    return data;
  }

  final String horiz;
  final String vertz;
}

class Children {
  Children({
    required this.type,
    required this.children,
  });

  factory Children.fromJson(Map<String, dynamic> json) {
    final children = <Fields>[];
    if (json['children'] != null) {
      json['children'].forEach((field) {
        children.add(field.fromJson(field));
      });
    }
    return Children(
      type: json['type'],
      children: children,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    if (children != null) {
      data['children'] = children!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  String type;
  List<Fields>? children;
}

class TableExtoField {
  TableExtoField({
    required this.name,
    required this.refID,
    required this.sId,
    required this.isMaster,
  });

  factory TableExtoField.fromJson(Map<String, dynamic> json) {
    return TableExtoField(
      name: json['name'] ?? '',
      refID: json['refID'] ?? '',
      sId: json['_id'] ?? '',
      isMaster: json['isMaster'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['refID'] = refID;
    data['_id'] = sId;
    data['isMaster'] = isMaster;
    return data;
  }

  final String name;
  final String refID;
  final String sId;
  final bool isMaster;
}

class Columns {
  Columns({
    required this.id,
    required this.name,
    required this.label,
    required this.type,
  });

  factory Columns.fromJson(Map<String, dynamic> json) {
    return Columns(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      label: json['label'] ?? '',
      type: json['type'] ?? '',
    );
  }

  final String id;
  final String name;
  final String label;
  final String type;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'label': label,
      'type': type,
    };
  }
}

class Rules {
  Rules({
    this.name,
    this.event,
    this.disabled,
    this.actions,
    this.conditions,
  });

  Rules.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    event = json['event'];
    disabled = json['disabled'];
    if (json['actions'] != null) {
      actions = <Actions>[];
      json['actions'].forEach((v) {
        actions!.add(Actions.fromJson(v));
      });
    }
    if (json['conditions'] != null) {
      conditions = <Conditions>[];
      json['conditions'].forEach((v) {
        conditions!.add(Conditions.fromJson(v));
      });
    }
  }

  String? name;
  String? event;
  bool? disabled;
  List<Actions>? actions;
  List<Conditions>? conditions;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['event'] = event;
    data['disabled'] = disabled;
    if (actions != null) {
      data['actions'] = actions!.map((v) => v.toJson()).toList();
    }
    if (conditions != null) {
      data['conditions'] = conditions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Actions {
  Actions({
    this.type,
    this.field,
    this.value,
    this.fieldType,
    this.filterType,
  });

  Actions.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    field = json['field'];
    value = json['value'];
    fieldType = json['fieldType'];
    filterType = json['filterType'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['field'] = field;
    data['value'] = value;
    data['fieldType'] = fieldType;
    data['filterType'] = filterType;
    return data;
  }

  String? type;
  String? field;
  dynamic value;
  String? fieldType;
  dynamic filterType;
}

class Conditions {
  Conditions({
    this.field,
    this.type,
    this.matcher,
    this.value,
  });

  Conditions.fromJson(Map<String, dynamic> json) {
    field = json['field'];
    type = json['type'];
    matcher = json['matcher'];
    value = json['value'];
  }

  String? field;
  String? type;
  String? matcher;
  dynamic value;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['field'] = field;
    data['type'] = type;
    data['matcher'] = matcher;
    if (value != null) {
      data['value'] = value!.map((v) => v).toList();
    }
    return data;
  }
}

class ExtField {
  ExtField(
    this.id,
    this.params,
  );

  ExtField.fromJson(Map<String, dynamic> json) {
    final parameters = <dynamic>[];
    if (json['params'] != null) {
      json['params'].forEach((v) {
        parameters.add(FieldAlignment.fromJson(v));
      });
    }
    id = json['id'] ?? '';
    params = parameters;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['params'] = params?.map((v) => v).toList();
    return data;
  }

  List<dynamic>? params;
  String? id;
}
