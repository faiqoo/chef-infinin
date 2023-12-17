import 'package:flutter/widgets.dart';

typedef FieldOnChange = Function({
  required String key,
  required dynamic value,
});

abstract class IRendererService<T, E> {
  Map<String, dynamic> get fieldInputData;
  Widget build({
    required T fieldData,
    required FieldOnChange onValueChange,
    String? recordId,
    bool? isInEditMode,
    E? fieldValues,
  });
  void updateFieldInputData({
    required String key,
    required value,
  });

  void clearFieldInputData();
}
