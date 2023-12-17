import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chef/base/base.dart';

part 'account_settings_screen_m.freezed.dart';

@freezed
class AccountSettingsScreenState extends BaseState
    with _$AccountSettingsScreenState {
  const factory AccountSettingsScreenState.initialized({
    @Default('dd/MM/yyyy') String selectedDateFormat,
  }) = Initialized;
}
