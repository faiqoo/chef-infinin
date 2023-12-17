import 'package:flutter/material.dart';

import 'package:chef/constants/constants.dart';
import 'package:chef/models/models.dart';
import 'package:chef/services/services.dart';
import 'package:chef/setup.dart';
import 'package:chef/theme/app_theme_widget.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';

import '../../../services/renderer/field_renderer_helpers.dart';

class InputCustomField extends StatefulWidget {
  const InputCustomField({
    required FieldProperties properties,
    required bool isMultiline,
    required FieldOnChange onChange,
    bool hasScanFeature = false,
    String? initValue,
    bool isNumber = false,
    Key? key,
  })  : _properties = properties,
        _isMultiline = isMultiline,
        _onChange = onChange,
        _initValue = initValue ?? '',
        _isNumber = isNumber,
        _hasScanFeature = hasScanFeature,
        super(key: key);

  factory InputCustomField.withScanner({
    required FieldProperties properties,
    required bool isMultiline,
    required FieldOnChange onChange,
    String? initValue,
  }) {
    return InputCustomField(
      properties: properties,
      isMultiline: isMultiline,
      onChange: onChange,
      initValue: initValue,
      hasScanFeature: true,
    );
  }

  final FieldProperties _properties;
  final bool _isMultiline;
  final bool _hasScanFeature;
  final FieldOnChange _onChange;
  final String _initValue;
  final bool _isNumber;

  @override
  State<InputCustomField> createState() => _InputCustomFieldState();
}

class _InputCustomFieldState extends State<InputCustomField> {
  final _navigator = locateService<INavigationService>();
  final _textController = TextController();

  @override
  void initState() {
    _textController.text = widget._initValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return GeneralLabelContainer(
      isReadOnly: widget._properties.isReadOnly,
      isMandatory: widget._properties.isMandatory,
      hideLabel: widget._properties.hideLabel,
      label: widget._properties.label,
      helpText: widget._properties.helpText,
      child: GeneralTextInput(
        isEnable: !widget._properties.isReadOnly,
        controller: _textController,
        isMultiline: widget._isMultiline,
        suffixIcon:
            widget._hasScanFeature ? Icons.document_scanner_outlined : null,
        onSuffixIconClick: widget._hasScanFeature
            ? () {
                //  barcodeScan(context);
              }
            : null,
        key: widget.key,
        onChanged: (value) {
          if (value.isNotEmpty) {
            widget._onChange.call(
              key: widget._properties.name,
              value: value,
            );
          }
        },
        validator: widget._properties.isMandatory
            ? FieldRendererHelpers.validatorFunction
            : null,
        backgroundColor: !widget._properties.isReadOnly
            ? null
            : appTheme.colors.disabledText,
        inputType: widget._isNumber ? InputType.digit : InputType.text,
      ),
    );
  }
}
