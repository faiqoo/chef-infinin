import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:chef/services/device/device_service.dart';
import 'package:chef/setup.dart';
import 'package:chef/constants/constants.dart';
import 'package:chef/theme/theme.dart';
import 'package:chef/ui_kit/general_ui_kit.dart';

class GeneralLogo extends StatelessWidget {
  const GeneralLogo({Key? key}) : super(key: key);

  static const _size8 = 8.0;
  static const _size20 = 20.0;

  @override
  Widget build(BuildContext context) {
    final _screenSizeData = locateService<IDeviceService>().screenSizeData();
    final _screenType = _screenSizeData.screenType;
    final _size = _screenSizeData.size;
    final _isTablet = _screenType == ScreenType.medium;
    final _appTheme = AppTheme.of(context).theme;
    final _mobileStyle = _appTheme.typographies.interFontFamily.body2.copyWith(
      color: _appTheme.colors.platformTextColor,
      fontStyle: FontStyle.italic,
    );

    final _tabStyle = _appTheme.typographies.interFontFamily.body2.copyWith(
      color: _appTheme.colors.platformTextColor,
      fontStyle: FontStyle.italic,
      fontSize: _size20,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SvgPicture.asset(
          Resources.exto,
          width: _isTablet ? _size.width * .21 : null,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: _size8,
        ),
        GeneralText(
          Strings.platform,
          style: !_isTablet ? _mobileStyle : _tabStyle,
        ),
      ],
    );
  }
}
