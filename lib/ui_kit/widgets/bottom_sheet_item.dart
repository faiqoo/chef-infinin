import 'package:flutter/material.dart';

import 'package:chef/theme/app_theme_data/app_theme_data.dart';
import 'package:chef/theme/app_theme_widget.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';

class BottomSheetItem extends StatelessWidget {
  const BottomSheetItem({
    required bool isSelected,
    required String title,
    required String subtitle,
    Key? key,
  })  : _isSelected = isSelected,
        _title = title,
        _subtitle = subtitle,
        super(key: key);

  final bool _isSelected;
  final String _title;
  final String _subtitle;

  static const _verticalPadding = 12.0;
  static const _horizontalPadding = 16.0;
  static const _bottomMargin = 2.0;
  static const _workIconSize = 22.0;
  static const _checkIconSize = 15.0;
  static const _iconBottomPadding = 11.0;
  static const _textOpacity = 0.7;
  static const _containerSize = 4.0;
  static const _containerHorizantalMargin = 8.0;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;

    return Container(
      color: _isSelected
          ? appTheme.colors.selectedBottomSheetItemBackground
          : null,
      padding: const EdgeInsets.symmetric(
        vertical: _verticalPadding,
        horizontal: _horizontalPadding,
      ),
      margin: const EdgeInsets.only(bottom: _bottomMargin),
      child: Row(
        children: [
          Icon(
            Icons.work,
            color: _isSelected
                ? appTheme.colors.selectedBottomSheetItem
                : appTheme.colors.workspaceIcon,
            size: _workIconSize,
          ),
          const SizedBox(
            width: _iconBottomPadding,
          ),
          GeneralText(
            _title,
            typography: TypographyFamily.body2R,
            color: _isSelected
                ? appTheme.colors.primaryText
                : appTheme.colors.primaryText.withOpacity(_textOpacity),
          ),
          Container(
            height: _containerSize,
            width: _containerSize,
            margin: const EdgeInsets.symmetric(
              horizontal: _containerHorizantalMargin,
            ),
            decoration: BoxDecoration(
              color: appTheme.colors.workspaceIcon,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: GeneralText(
              _subtitle,
              typography: TypographyFamily.body2R,
              color: appTheme.colors.primaryText.withOpacity(_textOpacity),
            ),
          ),
          const Spacer(),
          if (_isSelected)
            Icon(
              Icons.check_sharp,
              size: _checkIconSize,
              color: appTheme.colors.lightPrimaryBackground,
            )
        ],
      ),
    );
  }
}
