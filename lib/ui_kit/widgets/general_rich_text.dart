import 'package:flutter/material.dart';
import 'package:chef/theme/app_theme_widget.dart';

class GeneralRichText extends StatelessWidget {
  const GeneralRichText({
    required String title,
    TextStyle? titleStyle,
    Icon? icon,
    Key? key,
  })  : _title = title,
        _titleStyle = titleStyle,
        _icon = icon,
        super(key: key);

  final String _title;
  final TextStyle? _titleStyle;
  final Icon? _icon;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return RichText(
      text: TextSpan(
        children: <InlineSpan>[
          TextSpan(
            text: _title,
            style: _titleStyle ??
                appTheme.typographies.interFontFamily.body2M
                    .copyWith(color: appTheme.colors.tertiaryText),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: _icon ?? const SizedBox(),
          ),
        ],
      ),
    );
  }
}
