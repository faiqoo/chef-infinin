import 'package:flutter/material.dart';

import 'package:chef/services/services.dart';

class DeviceHelper {
  static const _minimumWidth = 550;

  static ScreenSizeData screenSizeData() {
    final _data = MediaQueryData.fromWindow(WidgetsBinding.instance.window);
    final _screenType = _data.size.shortestSide < _minimumWidth
        ? ScreenType.small
        : ScreenType.medium;

    return ScreenSizeData(
      size: _data.size,
      screenType: _screenType,
    );
  }
}
