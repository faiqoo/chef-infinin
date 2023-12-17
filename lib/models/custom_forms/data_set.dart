class Selectable {
  Selectable({
    required this.data,
  });

  factory Selectable.fromJson(Map<String, dynamic> json) => Selectable(
        data: SelectableData.fromJson(json),
      );

  Map<String, dynamic> toJson() => {
        'items': data.toJson(),
      };

  final SelectableData data;
}

class SelectableData {
  SelectableData({
    required this.id,
    required this.isActive,
    required this.name,
    required this.moduleName,
    required this.items,
    required this.createdBy,
    required this.tenantId,
    required this.refId,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory SelectableData.fromJson(Map<String, dynamic> json) {
    return SelectableData(
      id: json['id'] ?? json['_id'],
      isActive: json['isActive'],
      name: json['name'],
      moduleName: json['moduleName'],
      items: List<Item>.from(json['items'].map((x) => Item.fromJson(x))),
      createdBy: json['createdBy'],
      tenantId: json['tenantID'],
      refId: json['refID'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() => {
        '_id': id,
        'isActive': isActive,
        'name': name,
        'moduleName': moduleName,
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
        'createdBy': createdBy,
        'tenantID': tenantId,
        'refID': refId,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        '__v': v,
      };

  final String id;
  final bool isActive;
  final String name;
  final String moduleName;
  final List<Item> items;
  final String createdBy;
  final String tenantId;
  final String refId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;
}

class Item {
  Item({
    required this.children,
    required this.label,
    required this.value,
    required this.hidden,
    required this.disabled,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        children: List<dynamic>.from(json['children'].map((x) => x)),
        label: json['label'],
        value: json['value'],
        hidden: json['hidden'] ?? false,
        disabled: json['disabled'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'children': List<dynamic>.from(children.map((x) => x)),
        'label': label,
        'value': value,
        'hidden': hidden,
        'disabled': disabled,
      };

  final List<dynamic> children;
  final String label;
  final String value;
  final bool hidden;
  final bool disabled;
}

class Dropdown {
  Dropdown({
    required this.itemsData,
  });

  factory Dropdown.fromJson(Map<String, dynamic> json) {
    final items = <DropdownItems>[];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(DropdownItems.fromJson(v));
      });
    }
    return Dropdown(
      itemsData: items,
    );
  }

  final List<DropdownItems> itemsData;
}

class DropdownItems {
  DropdownItems({
    required this.label,
    required this.value,
    required this.hidden,
    required this.disabled,
  });

  factory DropdownItems.fromJson(Map<String, dynamic> json) => DropdownItems(
        label: json['label'],
        value: json['value'],
        hidden: json['hidden'] ?? false,
        disabled: json['disabled'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
        'hidden': hidden,
        'disabled': disabled,
      };

  final String label;
  final String value;
  final bool hidden;
  final bool disabled;
}
