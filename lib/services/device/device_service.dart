import 'package:flutter/material.dart';

enum ScreenType {
  small,
  medium,
}

class ScreenSizeData {
  ScreenSizeData({
    required this.size,
    required this.screenType,
  });

  final Size size;
  final ScreenType screenType;
}

abstract class IDeviceService {
  ScreenSizeData screenSizeData();
}
