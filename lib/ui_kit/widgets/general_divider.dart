import 'package:flutter/material.dart';

import 'package:chef/theme/theme.dart';

class GeneralDivider extends StatelessWidget {
  const GeneralDivider({
    double thickness = 1.0,
    Axis orientation = Axis.horizontal,
    Color? color,
    double? width,
    double? height,
    Key? key,
  })  : _orientation = orientation,
        _thickness = thickness,
        _height = height,
        _width = width,
        _color = color,
        super(key: key);

  factory GeneralDivider.horizontal({
    Axis orientation = Axis.horizontal,
    double thickness = 1.0,
    double? height,
    Color? color,
  }) {
    return GeneralDivider(
      orientation: orientation,
      thickness: thickness,
      height: height,
      color: color,
    );
  }

  factory GeneralDivider.vertical({
    Axis orientation = Axis.vertical,
    double thickness = 1.0,
    double? width,
    Color? color,
  }) {
    return GeneralDivider(
      orientation: orientation,
      thickness: thickness,
      width: width,
      color: color,
    );
  }

  final Axis _orientation;
  final double _thickness;
  final double? _width;
  final double? _height;
  final Color? _color;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    final color = _color ?? appTheme.colors.divider;
    return _orientation == Axis.horizontal
        ? Divider(
            color: color,
            thickness: _thickness,
            height: _height,
          )
        : VerticalDivider(
            color: color,
            thickness: _thickness,
            width: _width,
          );
  }
}
