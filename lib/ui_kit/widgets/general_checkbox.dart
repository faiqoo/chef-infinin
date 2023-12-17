import 'package:flutter/material.dart';

import 'package:chef/screens/custom_form/fields/base/exto_field_base.dart';
import 'package:chef/services/services.dart';

import '../../services/renderer/field_renderer_helpers.dart';

class GeneralCheckbox extends ExtoFieldBase<bool> {
  GeneralCheckbox({
    required this.title,
    required String name,
    FormFieldValidator<bool>? validator,
    ValueChanged<bool?>? onChanged,
    bool? initialValue,
    Key? key,
    InputDecoration decoration = const InputDecoration(
      border: InputBorder.none,
      focusedBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
    ),
    bool enabled = true,
    FormFieldSetter<bool?>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    VoidCallback? onReset,
    FocusNode? focusNode,
    this.controlAffinity = ControlAffinity.leading,
    this.selected = false,
    this.isDisabled = false,
    this.orientation = FieldOrientation.vertical,
  }) : super(
          key: key,
          initialValue: initialValue,
          name: name,
          validator: validator,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          onSaved: onSaved,
          enabled: enabled,
          onReset: onReset,
          focusNode: focusNode,
          decoration: decoration,
          builder: (FormFieldState<bool?> field) {
            final state = field as _ExtoCheckboxState;
            return InputDecorator(
              decoration: state.decoration,
              child: CheckboxListTile(
                dense: true,
                title: title,
                value: state.value ?? false,
                onChanged: state.isEnabled
                    ? (val) {
                        state.didChange(val);
                      }
                    : null,
                contentPadding: EdgeInsets.zero,
                selected: selected,
              ),
            );
          },
        );

  final Widget title;
  final ControlAffinity controlAffinity;
  final FieldOrientation orientation;
  final bool isDisabled;
  final bool selected;

  @override
  _ExtoCheckboxState createState() => _ExtoCheckboxState();
}

class _ExtoCheckboxState extends ExtoFieldState<GeneralCheckbox, bool> {}
