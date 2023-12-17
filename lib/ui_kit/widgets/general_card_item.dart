import 'package:flutter/material.dart';

import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';
import 'package:flutter_svg/svg.dart';

class GeneralCardItem extends StatelessWidget {
  const GeneralCardItem({
    required String title,
    required String subtitle,
    String? heroText,
    Color? leadingWidgetBackground,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
    ShapeBorder? cardShape,
    SvgPicture? svgPicture,
    double padding = 24.0,
    Key? key,
  })  : _title = title,
        _subtitle = subtitle,
        _heroText = heroText,
        _leadingWidgetBackground = leadingWidgetBackground,
        _titleStyle = titleStyle,
        _subtitleStyle = subtitleStyle,
        _cardShape = cardShape,
        _svgPicture = svgPicture,
        _padding = padding,
        super(key: key);

  final String _title;
  final String? _heroText;
  final Color? _leadingWidgetBackground;
  final TextStyle? _titleStyle;
  final TextStyle? _subtitleStyle;
  final String _subtitle;
  final ShapeBorder? _cardShape;
  final SvgPicture? _svgPicture;
  final double _padding;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Card(
      shape: _cardShape ?? appTheme.cardBorder,
      child: Padding(
        padding: EdgeInsets.all(_padding),
        // padding: EdgeInsets.only(left: _padding, right: _padding),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: GeneralPlaceholder(
            title: _heroText ?? _title,
            color: _leadingWidgetBackground,
          ),
          title: GeneralText(
            _title,
            style: _titleStyle,
          ),
          subtitle: GeneralText(
            _subtitle,
            style: _subtitleStyle,
          ),
          trailing: _svgPicture,
        ),
      ),
    );
  }
}
