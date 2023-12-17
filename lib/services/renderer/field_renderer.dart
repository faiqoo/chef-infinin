import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';

import 'package:chef/models/models.dart';
import 'package:chef/screens/custom_form/fields/custom_fields.dart';
import 'package:chef/services/services.dart';

import 'field_renderer_helpers.dart';

@lazySingleton
class FieldRenderer implements IRendererService<Fields, dynamic> {
  FieldRenderer({
    Map<String, dynamic>? fieldInputData,
  }) : _fieldInputData = fieldInputData ?? {};

  final Map<String, dynamic> _fieldInputData;

  @override
  Widget build({
    required Fields fieldData,
    required FieldOnChange onValueChange,
    String? recordId,
    bool? isInEditMode,
    dynamic fieldValues,
  }) {
    const _multiLine = 'MULTI_LINE';
    final fieldType = FieldRendererHelpers.specifyFieldType(fieldData.type);
    switch (fieldType) {
      case FieldType.text:
        return InputCustomField.withScanner(
          properties: fieldData.properties!,
          isMultiline: fieldData.properties!.inputType == _multiLine,
          onChange: onValueChange,
          initValue:
              fieldValues == null || fieldValues.isEmpty ? '' : fieldValues,
        );
      case FieldType.paragraph:
        return ParagraphCustomField(
          content: fieldData.properties!.content,
          fieldHeightType: FieldRendererHelpers.specifyHeightType(
            fieldData.properties!.height,
          ),
          paragraphSize: FieldRendererHelpers.specifyParagraphSize(
            fieldData.properties!.size,
          ),
          style: fieldData.properties!.style,
        );
      case FieldType.number:
        return InputCustomField(
          properties: fieldData.properties!,
          isMultiline: fieldData.properties!.inputType == _multiLine,
          isNumber: true,
          initValue: fieldValues == null ? '' : fieldValues.toString(),
          onChange: onValueChange,
        );
      case FieldType.date:
        return DateCustomField(
          properties: fieldData.properties!,
          onChange: onValueChange,
          initValue:
              fieldValues == null || fieldValues.isEmpty ? '' : fieldValues,
        );
      case FieldType.section:
        return ColumnCustomField.section(
          id: fieldData.properties!.id,
          isHidden: fieldData.properties!.isHidden,
          children: fieldData.children![0].children!,
          title: fieldData.properties!.title,
          shortDescription: fieldData.properties!.shortDescription,
          rendererService: this,
          recordId: recordId,
          onChange: onValueChange,
        );
      case FieldType.column:
        return ColumnCustomField.single(
          id: UniqueKey().toString(),
          children: fieldData.children!,
          rendererService: this,
          recordId: recordId,
          onChange: onValueChange,
        );
      case FieldType.twoColumn:
        return ColumnCustomField.twoColumn(
          id: fieldData.properties!.id,
          alignments: fieldData.properties!.alignment ?? [],
          layoutFlex: fieldData.properties!.layout,
          children: fieldData.children!,
          rendererService: this,
          recordId: recordId,
          onChange: onValueChange,
        );
      case FieldType.threeColumn:
        return ColumnCustomField.threeColumn(
          id: fieldData.properties!.id,
          alignments: fieldData.properties!.alignment ?? [],
          layoutFlex: fieldData.properties!.layout,
          children: fieldData.children!,
          rendererService: this,
          recordId: recordId,
          onChange: onValueChange,
        );
      default:
        return InputCustomField(
          properties: fieldData.properties!,
          isMultiline: fieldData.properties!.inputType == _multiLine,
          onChange: onValueChange,
        );
    }
  }

  @override
  Map<String, dynamic> get fieldInputData => _fieldInputData;

  @override
  void clearFieldInputData() => fieldInputData.clear();

  @override
  void updateFieldInputData({
    required String key,
    required value,
  }) {
    fieldInputData.addAll({key: value});
  }
}
