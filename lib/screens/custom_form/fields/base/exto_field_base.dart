import 'package:flutter/material.dart';

class ExtoFieldBase<T> extends FormField<T> {
  const ExtoFieldBase({
    required FormFieldBuilder<T> builder,
    required this.name,
    T? initialValue,
    FormFieldSetter<T>? onSaved,
    bool enabled = true,
    FormFieldValidator<T>? validator,
    AutovalidateMode autovalidateMode = AutovalidateMode.onUserInteraction,
    this.onChanged,
    this.decoration = const InputDecoration(),
    this.onReset,
    this.focusNode,
    Key? key,
  }) : super(
          key: key,
          onSaved: onSaved,
          initialValue: initialValue,
          autovalidateMode: autovalidateMode,
          enabled: enabled,
          builder: builder,
          validator: validator,
        );

  final String name;

  /// Called when the field value is changed.
  final ValueChanged<T?>? onChanged;

  /// The border, labels, icons, and styles used to decorate the field.
  final InputDecoration decoration;

  /// Called when the field value is reset.
  final VoidCallback? onReset;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  @override
  ExtoFieldState<ExtoFieldBase<T>, T> createState() =>
      ExtoFieldState<ExtoFieldBase<T>, T>();
}

class ExtoFieldState<F extends ExtoFieldBase<T>, T> extends FormFieldState<T> {
  String? _customErrorText;

  @override
  F get widget => super.widget as F;

  ExtoFieldState? get formState => _formBuilderState;

  /// Returns the initial value, which may be declared at the field, or by the
  /// parent [FormBuilder.initialValue]. When declared at both levels, the field
  /// initialValue prevails.
  T? get initialValue =>
      widget.initialValue ??
      (_formBuilderState?.initialValue ??
          const <String, dynamic>{})[widget.name] as T?;

  ExtoFieldState? _formBuilderState;

  @override
  String? get errorText => super.errorText ?? _customErrorText;

  @override
  bool get hasError =>
      super.hasError || decoration.errorText != null || errorText != null;

  @override
  bool get isValid =>
      super.isValid && decoration.errorText == null && errorText == null;

  bool _touched = false;

  bool get isEnabled =>
      widget.enabled && (_formBuilderState?.isEnabled ?? true);

  FocusNode? _focusNode;
  FocusNode get effectiveFocusNode =>
      widget.focusNode ?? (_focusNode ??= FocusNode());

  @override
  void initState() {
    super.initState();
    _formBuilderState = context.findAncestorStateOfType<ExtoFieldState>();
    effectiveFocusNode.addListener(_touchedHandler);
    setValue(initialValue);
  }

  @override
  void dispose() {
    _focusNode?.removeListener(_touchedHandler);
    _focusNode?.dispose();
    super.dispose();
  }

  @override
  void save() {
    super.save();
  }

  void _touchedHandler() {
    if (_focusNode!.hasFocus && _touched == false) {
      setState(() => _touched = true);
    }
  }

  @override
  void didChange(T? value) {
    super.didChange(value);
    widget.onChanged?.call(value);
  }

  @override
  void reset() {
    super.reset();
    setValue(initialValue);
    widget.onReset?.call();
  }

  @override
  bool validate({bool clearCustomError = true}) {
    if (clearCustomError) {
      setState(() => _customErrorText = null);
    }
    return super.validate() && !hasError;
  }

  void requestFocus() {
    FocusScope.of(context).requestFocus(effectiveFocusNode);
    Scrollable.ensureVisible(context);
  }

  void invalidate(String errorText) {
    setState(() => _customErrorText = errorText);
    validate(clearCustomError: false);
    requestFocus();
  }

  InputDecoration get decoration => widget.decoration.copyWith(
        errorText: widget.decoration.errorText ?? errorText,
      );
}
