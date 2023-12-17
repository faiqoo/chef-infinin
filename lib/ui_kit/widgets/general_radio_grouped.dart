import 'package:flutter/material.dart';

import 'package:chef/ui_kit/widgets/general_radio.dart';
import 'package:chef/services/services.dart';
import 'package:chef/screens/custom_form/fields/base/exto_field_base.dart';
import 'package:chef/screens/custom_form/widgets/exto_field_option.dart';

import '../../services/renderer/field_renderer_helpers.dart';

class GeneralRadioGroup<T> extends ExtoFieldBase<T> {
  GeneralRadioGroup({
    required String name,
    required this.items,
    Key? key,
    FormFieldValidator<T>? validator,
    T? initialValue,
    InputDecoration decoration = const InputDecoration(),
    ValueChanged<T?>? onChanged,
    bool enabled = true,
    FormFieldSetter<T>? onSaved,
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled,
    VoidCallback? onReset,
    FocusNode? focusNode,
    this.isDisabled,
    this.controlAffinity = ControlAffinity.leading,
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
          builder: (FormFieldState<T?> field) {
            final state = field as _ExtoRadioGroupState<T>;

            return InputDecorator(
              decoration: state.decoration,
              child: GeneralRadio<T>(
                orientation: orientation,
                value: state.value,
                items: items,
                onChanged: (val) {
                  state.didChange(val);
                },
                isDisabled: state.isEnabled
                    ? isDisabled
                    : items
                        .map((fieldOption) => fieldOption.optionData.value as T)
                        .toList(),
                controlAffinity: controlAffinity,
              ),
            );
          },
        );

  final List<ExtoFieldOption<T>> items;
  final List<T>? isDisabled;
  final ControlAffinity controlAffinity;
  final FieldOrientation orientation;

  @override
  _ExtoRadioGroupState<T> createState() => _ExtoRadioGroupState<T>();
}

class _ExtoRadioGroupState<T> extends ExtoFieldState<GeneralRadioGroup<T>, T> {}
