import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chef/theme/theme.dart';

import 'dart:developer' as developer;

import 'package:flutter_svg/svg.dart';

import 'package:chef/constants/resources.dart';

enum InputType {
  text,
  password,
  email,
  digit,
}

class GeneralTextInput extends StatefulWidget {
  GeneralTextInput({
    required TextController controller,
    String? Function(String?)? validator,
    ValueChanged<bool>? onValidateChanged,
    ValueChanged<String>? onChanged,
    ValueChanged<void>? onEditingComplete,
    bool isMultiline = false,
    bool isEnable = true,
    InputType inputType = InputType.text,
    String? hint,
    String? labelText,
    TextStyle? labelStyle,
    TextStyle? valueStyle,
    TextStyle? hintStyle,
    IconData? prefixIcon,
    IconData? suffixIcon,
    void Function()? onSuffixIconClick,
    Color? backgroundColor,
    InputBorder? inputBorder,
    EdgeInsetsGeometry? contentPadding,
    double? height,
    double? textFieldWidth,
    Key? key,
  })  : _onChanged = onChanged,
        _onEditingComplete = onEditingComplete,
        _controller = controller,
        _hint = hint,
        _labelText = labelText,
        _labelStyle = labelStyle,
        _valueStyle = valueStyle,
        _hintStyle = hintStyle,
        _inputType = inputType,
        _prefixIcon = prefixIcon,
        _suffixIcon = suffixIcon,
        _isMultiline = isMultiline,
        _isEnable = isEnable,
        _backgroundColor = backgroundColor,
        _validator = validator,
        _onValidateChanged = onValidateChanged,
        _onSuffixIconClick = onSuffixIconClick,
        _inputBorder = inputBorder,
        _contentPadding = contentPadding,
        _textFieldHeight = height,
        _textFieldWidth = textFieldWidth,
        super(key: key) {
    _selectInputType();
  }

  final String? _hint;
  final String? _labelText;
  final TextStyle? _labelStyle;
  final TextStyle? _valueStyle;
  final TextStyle? _hintStyle;
  final InputType _inputType;
  final IconData? _prefixIcon;
  final IconData? _suffixIcon;
  final void Function()? _onSuffixIconClick;
  final ValueChanged<String>? _onChanged;
  final ValueChanged<void>? _onEditingComplete;
  final TextEditingController _controller;
  final bool _isMultiline;
  final bool _isEnable;
  final Color? _backgroundColor;
  final String? Function(String?)? _validator;
  final ValueChanged<bool>? _onValidateChanged;
  final InputBorder? _inputBorder;
  final EdgeInsetsGeometry? _contentPadding;
  final double? _textFieldHeight;
  final double? _textFieldWidth;
  late final TextInputType _keyboardType;
  late final bool _passwordMode;

  void _selectInputType() {
    switch (_inputType) {
      case InputType.email:
        _keyboardType = TextInputType.emailAddress;
        _passwordMode = false;
        break;
      case InputType.password:
        _keyboardType = TextInputType.visiblePassword;
        _passwordMode = true;
        break;
      case InputType.text:
        _keyboardType = TextInputType.text;
        _passwordMode = false;
        break;
      case InputType.digit:
        _keyboardType = TextInputType.number;
        _passwordMode = false;
        break;
      default:
        _keyboardType = TextInputType.text;
        _passwordMode = false;
        break;
    }
  }

  @override
  State<GeneralTextInput> createState() => _GeneralTextInputState();
}

class _GeneralTextInputState extends State<GeneralTextInput> {
  late bool _isPasswordHidden;
  final focusNode = FocusNode();
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _isPasswordHidden = widget._passwordMode;
    if (widget._controller.text.isNotEmpty) _validate();

    /// for every change in focus, the widget needs to be rebuilt
    /// to reflect color changes for character limitation and label
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        _validate();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return SizedBox(
      height: widget._textFieldHeight,
      width: widget._textFieldWidth ?? double.infinity,
      child: TextFormField(
        enabled: widget._isEnable,
        readOnly: !widget._isEnable,
        focusNode: focusNode,
        keyboardType: widget._keyboardType,
        obscureText: _isPasswordHidden,
        controller: widget._controller,
        maxLines: widget._isMultiline ? 3 : 1,
        textInputAction: TextInputAction.done,
        cursorColor: appTheme.colors.defaultBorder,
        inputFormatters: [
          if (widget._inputType == InputType.digit)
            FilteringTextInputFormatter.digitsOnly
        ],
        style: widget._valueStyle,
        decoration: InputDecoration(
          fillColor: widget._backgroundColor ?? appTheme.colors.transparent,
          filled: true,
          errorText: errorMessage,
          hintText: widget._hint,
          hintStyle: widget._hintStyle,
          labelText: widget._labelText,
          labelStyle: widget._valueStyle,
          floatingLabelStyle: widget._labelStyle,
          border: widget._inputBorder ?? appTheme.inputBorder,
          focusedBorder: widget._inputBorder ?? appTheme.inputBorder,
          enabledBorder: widget._inputBorder ?? appTheme.inputBorder,
          prefixIcon:
              widget._prefixIcon != null ? Icon(widget._prefixIcon) : null,
          //  suffixIcon: _buildSuffixIcon(appTheme),
          contentPadding:
        widget._contentPadding?? EdgeInsets.symmetric(vertical: 18,horizontal: 13)
        ),
        validator: widget._validator,
        onChanged: _onChange,
        onEditingComplete: _onEditingComplete,
      ),
    );
  }

  Widget _buildSuffixIcon(IAppThemeData appTheme) {
    switch (widget._inputType) {
      case InputType.password:
        return InkWell(
          onTap: _toggle,
          child: Container(
            width: 24,
            height: 24,
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            child: _isPasswordHidden
                ? SvgPicture.asset(
                    Resources.eyeClosedIcon,
                  )
                : SvgPicture.asset(
                    Resources.eyeOpenIcon,
                  ),
          ),
        );
      default:
        return widget._onSuffixIconClick != null
            ? InkWell(
                onTap: () => widget._onSuffixIconClick!.call(),
                child: Icon(
                  widget._suffixIcon,
                ),
              )
            : Icon(widget._suffixIcon);
    }
  }

  void _toggle() {
    setState(() {
      _isPasswordHidden = !_isPasswordHidden;
    });
  }

  void _onChange(newValue) {
    _validate();
    widget._onValidateChanged?.call(errorMessage == null);
    setState(() {});
    if (widget._onChanged != null) {
      widget._onChanged!(newValue);
    }
  }

  void _onEditingComplete() {
    developer.log('In Editing complete section ');
    _validate();
    widget._onValidateChanged?.call(errorMessage == null);
    setState(() {});
    if (widget._onEditingComplete != null) {
      //   widget._onChanged!();
    }
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _validate() {
    errorMessage = widget._validator?.call(widget._controller.text);
  }
}

class TextController extends TextEditingController {
  TextController({String? text}) {
    this.text = text;
  }

  @override
  set text(String? newText) {
    if (newText != null) {
      value = value.copyWith(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
        composing: TextRange.empty,
      );
    }
  }
}
