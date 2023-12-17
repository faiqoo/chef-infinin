import 'package:flutter/material.dart';
import 'package:chef/constants/strings.dart';
import 'package:chef/theme/app_theme_data/app_theme_data.dart';
import 'package:chef/theme/app_theme_widget.dart';
import 'package:chef/ui_kit/widgets/general_text.dart';

class GeneralEmptyIndicator extends StatelessWidget {
  const GeneralEmptyIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context).theme;
    return Center(
      child: GeneralText(
        Strings.emptyData,
        typography: TypographyFamily.headline4,
        color: appTheme.colors.defaultText,
      ),
    );
  }
}
