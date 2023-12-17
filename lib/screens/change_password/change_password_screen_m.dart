import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chef/base/base.dart';

part 'change_password_screen_m.freezed.dart';

@freezed
class ChangePasswordScreenState extends BaseState
    with _$ChangePasswordScreenState {
  const factory ChangePasswordScreenState.initialized({
    @Default('') String currentPassword,
    @Default('') String newPassword,
    @Default('') String confirmPassword,
    @Default(false) bool isLoading,
    @Default(false) bool isApiError,
    @Default('') String errorMessage,
  }) = Initialized;
}
