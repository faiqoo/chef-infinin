import 'package:flutter/material.dart';

import 'package:chef/theme/app_theme_data/app_theme_data.dart';
import 'package:chef/theme/app_theme_widget.dart';

class GeneralText extends StatelessWidget {
  const GeneralText(
    String text, {
    FontFamily fontFamily = FontFamily.poppins,
    TypographyFamily typography = TypographyFamily.body1,
    Color? color,
    TextStyle? style,
    TextAlign? textAlign,
    int? maxLines,
    Key? key,
  })  : _text = text,
        _typography = typography,
        _fontFamily = fontFamily,
        _color = color,
        _style = style,
        _textAlign = textAlign,
        _maxLines = maxLines,
        super(key: key);

  final String _text;
  final FontFamily _fontFamily;
  final TypographyFamily _typography;
  final Color? _color;
  final TextStyle? _style;
  final TextAlign? _textAlign;
  final int? _maxLines;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final defaultStyle = appTheme.getTextStyle(
      fontFamily: _fontFamily,
      typographyFamily: _typography,
      color: _color,
    );
    return Text(
      _text,
      maxLines: _maxLines,
      style: _style ?? defaultStyle,
      overflow: TextOverflow.ellipsis,
      textAlign: _textAlign,
    );
  }
}
