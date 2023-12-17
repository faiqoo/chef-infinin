import 'package:flutter/material.dart';

import 'package:chef/helpers/helpers.dart';
import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';

class GeneralPlaceholder extends StatelessWidget {
  const GeneralPlaceholder({
    required String title,
    Color? color,
    Key? key,
  })  : _title = title,
        _color = color,
        super(key: key);

  final String _title;
  final Color? _color;

  double get _size => 52.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Container(
      width: _size,
      height: _size,
      decoration: BoxDecoration(
        color: _color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: GeneralText(
          _title.getShortName(),
          style: appTheme.typographies.interFontFamily.label2.copyWith(
            color: appTheme.colors.secondaryBackground,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
