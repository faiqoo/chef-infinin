import 'package:flutter/material.dart';

import 'package:chef/ui_kit/widgets/general_text.dart';

class ExtoFieldOption<T> extends StatelessWidget {
  const ExtoFieldOption({
    required this.optionData,
    this.child,
    Key? key,
  }) : super(key: key);

  final Widget? child;
  final FieldOptionModel optionData;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: optionData.isDisable,
      child: child ?? GeneralText(optionData.label),
    );
  }
}

class FieldOptionModel<T> {
  FieldOptionModel({
    required this.id,
    required this.label,
    required this.value,
    this.isDisable = false,
    this.isHidden = false,
  });

  final String id;
  final String label;
  final T value;
  final bool isDisable;
  final bool isHidden;
}
