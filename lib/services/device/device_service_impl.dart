import 'package:chef/helpers/device_helper.dart';
import 'package:chef/services/services.dart';

class DeviceServiceImpl implements IDeviceService {
  @override
  ScreenSizeData screenSizeData() {
    return DeviceHelper.screenSizeData();
  }
}
