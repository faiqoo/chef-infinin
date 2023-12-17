import 'package:flutter/material.dart';

import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';

class BottomSheetDateFormatItem extends StatelessWidget {
  const BottomSheetDateFormatItem({
    required bool isSelected,
    required String title,
    Key? key,
  })  : _isSelected = isSelected,
        _title = title,
        super(key: key);

  final bool _isSelected;
  final String _title;

  static const _verticalPadding = 12.0;
  static const _horizontalPadding = 16.0;
  static const _bottomMargin = 2.0;
  static const _checkIconSize = 15.0;
  static const _textOpacity = 0.7;

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
          GeneralText(
            _title,
            typography: TypographyFamily.body2R,
            color: _isSelected
                ? appTheme.colors.primaryText
                : appTheme.colors.primaryText.withOpacity(_textOpacity),
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
