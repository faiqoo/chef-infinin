import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import 'package:chef/base/base.dart';
import 'package:chef/constants/constants.dart';
import 'package:chef/services/services.dart';
import 'package:chef/screens/account_settings/account_settings_screen_m.dart';

@injectable
class AccountSettingsScreenViewModel
    extends BaseViewModel<AccountSettingsScreenState> {
  AccountSettingsScreenViewModel({
    required IStorageService storage,
    required INavigationService navigation,
  })  : _storage = storage,
        _navigation = navigation,
        super(const Initialized());

  final IStorageService _storage;
  final INavigationService _navigation;

  String getSelectedFormat() {
    final format =
        _storage.readString(key: PreferencesKeys.sSelectedDateFormat);
    return format.isEmpty ? state.selectedDateFormat : format;
  }

  String getCurrentDate() {
    final selectedFormat = getSelectedFormat();
    final date = DateFormat(selectedFormat).format(DateTime.now());
    return date;
  }

  void updateDateFormat(String dateFormatOption) async {
    await _storage.writeString(
      key: PreferencesKeys.sSelectedDateFormat,
      data: dateFormatOption,
    );
    emit(state.copyWith(selectedDateFormat: dateFormatOption));
  }

  void showBottomSheet({required Future<dynamic> bottomSheet}) async {
    var selectedDateFormat = await bottomSheet;
    if (selectedDateFormat != null) {
      updateDateFormat(selectedDateFormat);
    }
  }

  void pop() => _navigation.pop();
}
