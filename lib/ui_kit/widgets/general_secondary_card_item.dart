import 'package:flutter/material.dart';

import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';

class GeneralSecondaryCardItem extends StatelessWidget {
  const GeneralSecondaryCardItem({
    required String title,
    required String subtitle,
    required bool isIconAvailable,
    required Color leadingWidgetBackground,
    String? heroText,
    Key? key,
  })  : _title = title,
        _subtitle = subtitle,
        _heroText = heroText,
        _isIconAvailable = isIconAvailable,
        _leadingWidgetBackground = leadingWidgetBackground,
        super(key: key);

  final String _title;
  final String? _heroText;
  final String _subtitle;
  final bool _isIconAvailable;
  final Color _leadingWidgetBackground;

  static const _padding = 16.0;
  static const _iconSize = 20.0;
  static const _iconBottomPadding = 12.0;
  static const _textOpacity = 0.7;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Container(
      padding: const EdgeInsets.all(_padding),
      decoration: appTheme.workspaceItemDecoration,
      child: Row(
        children: [
          _isIconAvailable
              ? GeneralHero.largeIcon(
                  icon: Icon(
                    Icons.work,
                    color: appTheme.colors.secondaryBackground,
                    size: _iconSize,
                  ),
                  isShapeSquare: true,
                  leadingBackground: _leadingWidgetBackground,
                )
              : GeneralHero.mediumText(
                  text: _heroText ?? _title,
                  isShapeSquare: true,
                  leadingBackground: _leadingWidgetBackground,
                ),
          const SizedBox(
            width: _iconBottomPadding,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GeneralText(
                  _title,
                  typography: TypographyFamily.label2,
                ),
                GeneralText(
                  _subtitle,
                  typography: TypographyFamily.label4,
                  color: appTheme.colors.workspaceSubtitle
                      .withOpacity(_textOpacity),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
