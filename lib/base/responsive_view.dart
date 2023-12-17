import 'package:flutter/material.dart';

import 'package:chef/services/services.dart';

abstract class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    required IDeviceService deviceService,
    Key? key,
  })  : _deviceService = deviceService,
        super(key: key);

  final IDeviceService _deviceService;

  @override
  Widget build(BuildContext context) {
    return buildScreen(
      context: context,
      screenSizeData: _deviceService.screenSizeData(),
    );
  }

  Widget buildScreen({
    required BuildContext context,
    required ScreenSizeData screenSizeData,
  });
}
