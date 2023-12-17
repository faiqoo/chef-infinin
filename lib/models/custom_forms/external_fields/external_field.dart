import 'dart:convert';

ExternalField externalFieldFromJson(String str) =>
    ExternalField.fromJson(json.decode(str));

String externalFieldToJson(ExternalField data) => json.encode(data.toJson());

class ExternalField {
  ExternalField({
    required this.id,
    required this.name,
    required this.parentKind,
    required this.refId,
    required this.tenantId,
    required this.createdAt,
    required this.createdBy,
    required this.parent,
    required this.externalFieldExternal,
  });

  factory ExternalField.fromJson(Map<String, dynamic> json) => ExternalField(
        id: json['_id'],
        name: json['name'],
        parentKind: json['parentKind'],
        refId: json['refId'],
        tenantId: json['tenantID'],
        createdAt: json['createdAt'],
        createdBy: json['createdBy'],
        parent: Parent.fromJson(json['parent']),
        externalFieldExternal: External.fromJson(json['external']),
      );

  String id;
  String name;
  String parentKind;
  String refId;
  String tenantId;
  int createdAt;
  String createdBy;
  Parent parent;
  External externalFieldExternal;
  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'parentKind': parentKind,
        'refId': refId,
        'tenantID': tenantId,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'parent': parent.toJson(),
        'external': externalFieldExternal.toJson(),
      };
}

class External {
  External({
    required this.targetKind,
    required this.target,
    required this.table,
    required this.value,
    required this.display,
  });

  factory External.fromJson(Map<String, dynamic> json) => External(
        targetKind: json['targetKind'],
        target: Parent.fromJson(json['target']),
        table: Table.fromJson(json['table']),
        value: Value.fromJson(json['value']),
        display: Display.fromJson(json['display']),
      );

  String targetKind;
  Parent target;
  Table table;
  Value value;
  Display display;

  Map<String, dynamic> toJson() => {
        'targetKind': targetKind,
        'target': target.toJson(),
        'table': table.toJson(),
        'value': value.toJson(),
        'display': display.toJson(),
      };
}

class Display {
  Display({
    required this.uiType,
    required this.primaryField,
    required this.columns,
  });

  factory Display.fromJson(Map<String, dynamic> json) => Display(
        uiType: json['uiType'],
        primaryField: PrimaryField.fromJson(json['primaryField']),
        columns: List<PrimaryField>.from(
          json['columns'].map((x) => PrimaryField.fromJson(x)),
        ),
      );

  String uiType;
  PrimaryField primaryField;
  List<PrimaryField> columns;

  Map<String, dynamic> toJson() => {
        'uiType': uiType,
        'primaryField': primaryField.toJson(),
        'columns': List<dynamic>.from(columns.map((x) => x.toJson())),
      };
}

class PrimaryField {
  PrimaryField({
    required this.label,
    required this.name,
    required this.type,
  });

  factory PrimaryField.fromJson(Map<String, dynamic> json) => PrimaryField(
        label: json['label'],
        name: json['name'],
        type: json['type'],
      );

  String label;
  String name;
  String type;

  Map<String, dynamic> toJson() => {
        'label': label,
        'name': name,
        'type': type,
      };
}

class Table {
  Table({
    required this.tableId,
    required this.id,
  });

  factory Table.fromJson(Map<String, dynamic> json) => Table(
        tableId: json['_id'],
        id: json['ID'],
      );
  String tableId;
  String id;

  Map<String, dynamic> toJson() => {
        '_id': tableId,
        'ID': id,
      };
}

class Parent {
  Parent({
    required this.refId,
    required this.name,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        refId: json['refId'],
        name: json['name'],
      );

  String refId;
  String name;

  Map<String, dynamic> toJson() => {
        'refId': refId,
        'name': name,
      };
}

class Value {
  Value({
    required this.fields,
    required this.primaryField,
  });

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        fields: json['field'] != null
            ? List<dynamic>.from(json['fields'].map((x) => x))
            : [],
        primaryField: PrimaryField.fromJson(json['primaryField']),
      );

  List<dynamic> fields;
  PrimaryField primaryField;

  Map<String, dynamic> toJson() => {
        'fields': List<dynamic>.from(fields.map((x) => x)),
        'primaryField': primaryField.toJson(),
      };
}

class ExtFieldDisplay {
  ExtFieldDisplay({
    required this.title,
    required this.subtitle,
    required this.value,
    this.primaryFieldValue,
  });
  factory ExtFieldDisplay.empty() => ExtFieldDisplay(
        title: [],
        subtitle: [],
        value: [],
        primaryFieldValue: '',
      );

  final List<String> title;
  final List<String> subtitle;
  final List<String> value;
  final String? primaryFieldValue;

  ExtFieldDisplay copyWith({
    List<String>? title,
    List<String>? subtitle,
    List<String>? value,
    String? primaryFieldValue,
  }) {
    return ExtFieldDisplay(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      value: value ?? this.value,
      primaryFieldValue: primaryFieldValue ?? this.primaryFieldValue,
    );
  }
}

class ExtFieldSend {
  ExtFieldSend({
    required this.title,
    required this.value,
    required this.primaryFieldValue,
    this.subtitle,
  });
  final String title;
  final String? subtitle;
  final String value;
  final String primaryFieldValue;

  @override
  String toString() =>
      'ExtFieldSend(title: $title, subtitle: $subtitle, value: $value, primaryFieldValue: $primaryFieldValue)';
}

class DataFromExtField {
  DataFromExtField({
    required this.names,
    required this.displayPrimaryField,
    required this.valuePrimaryField,
  });

  factory DataFromExtField.empty() => DataFromExtField(
        names: [],
        displayPrimaryField: '',
        valuePrimaryField: '',
      );

  final List<String> names;
  final String displayPrimaryField;
  final String valuePrimaryField;

  DataFromExtField copyWith({
    List<String>? names,
    String? displayPrimaryField,
    String? valuePrimaryField,
  }) {
    return DataFromExtField(
      names: names ?? this.names,
      displayPrimaryField: displayPrimaryField ?? this.displayPrimaryField,
      valuePrimaryField: valuePrimaryField ?? this.valuePrimaryField,
    );
  }
}
