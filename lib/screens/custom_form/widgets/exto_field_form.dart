import 'package:flutter/material.dart';

import 'package:chef/models/models.dart';
import 'package:chef/services/services.dart';

class ExtoForm extends StatelessWidget {
  const ExtoForm({
    required IRendererService renderer,
    required List<Fields> fields,
    required GlobalKey<FormState> formKey,
    String? recordId,
    bool isInEditMode = false,
    bool hasEditPermission = true,
    Key? key,
  })  : _renderer = renderer,
        _fields = fields,
        _formKey = formKey,
        _recordId = recordId,
        _isInEditMode = isInEditMode,
        _hasEditPermission = hasEditPermission,
        super(key: key);

  final List<Fields> _fields;
  final GlobalKey<FormState> _formKey;
  final IRendererService _renderer;
  final String? _recordId;
  final bool _hasEditPermission;
  final bool _isInEditMode;

  @override
  Widget build(BuildContext context) {
    final _fieldInputData = _renderer.fieldInputData;
    final widgetTree = <Widget>[];

    for (var field in _fields) {
      widgetTree.add(
        _renderer.build(
          fieldData: field,
          recordId: _recordId != null ? _recordId! : '',
          isInEditMode: _isInEditMode,
          fieldValues: _fieldInputData.isNotEmpty &&
                  _recordId != null &&
                  _fieldInputData[_recordId!] != null &&
                  _fieldInputData[_recordId!][field.properties!.name] != null
              ? _fieldInputData[_recordId!][field.properties!.name]
              : _fieldInputData[field.properties!.name] ?? '',
          onValueChange: ({
            required String key,
            required dynamic value,
          }) {
            if (_recordId != null && (_recordId != '')) {
              _fieldInputData[_recordId!][key] = value;
              _renderer.updateFieldInputData(
                key: _recordId!,
                value: _fieldInputData[_recordId!],
              );
            } else {
              _renderer.updateFieldInputData(
                key: key,
                value: value,
              );
            }
          },
        ),
      );
    }

    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: AbsorbPointer(
          absorbing: !_hasEditPermission,
          child: Column(
            children: [...widgetTree],
          ),
        ),
      ),
    );
  }
}
