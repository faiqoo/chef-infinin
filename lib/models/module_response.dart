import 'dart:convert';

import 'package:equatable/equatable.dart';

ModuleListResponse moduleListResponseFromJson(String str) =>
    ModuleListResponse.fromJson(json.decode(str));

String moduleListResponseToJson(ModuleListResponse data) =>
    json.encode(data.toJson());

class ModuleListResponse extends Equatable {
  factory ModuleListResponse.fromJson(Map<String, dynamic> json) =>
      ModuleListResponse(
        rows: List<Module>.from(json['rows'].map((x) => Module.fromJson(x))),
        total: json['total'],
        page: json['page'],
        pageSize: json['pageSize'],
        totalPages: json['totalPages'],
      );

  const ModuleListResponse({
    required this.rows,
    required this.total,
    required this.page,
    required this.pageSize,
    required this.totalPages,
  });

  final List<Module> rows;
  final int total;
  final int page;
  final int pageSize;
  final int totalPages;

  Map<String, dynamic> toJson() => {
        'rows': List<Module>.from(rows.map((x) => x.toJson())),
        'total': total,
        'page': page,
        'pageSize': pageSize,
        'totalPages': totalPages,
      };

  @override
  List<Object?> get props => [
        rows,
        total,
        page,
        pageSize,
        totalPages,
      ];
}

class Module extends Equatable {
  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json['_id'],
        name: json['name'],
        displayName: json['displayName'],
        description: json['description'],
        tenantId: json['tenantID'],
        refId: json['refID'],
      );
  const Module({
    required this.id,
    required this.tenantId,
    required this.name,
    required this.description,
    required this.displayName,
    required this.refId,
  });

  final String id;
  final String tenantId;
  final String name;
  final String description;
  final String displayName;
  final String refId;

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'displayName': displayName,
        'description': description,
        'tenantID': tenantId,
        'refID': refId,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        displayName,
        description,
        tenantId,
      ];
}
