import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chef/base/base.dart';

part 'forgot_password_screen_m.freezed.dart';

@freezed
class ForgotPasswordScreenState extends BaseState
    with _$ForgotPasswordScreenState {
  const factory ForgotPasswordScreenState.initialized({
    required String email,
    required bool isBusy,
    @Default(false) bool success,
    @Default('') String errorMessage,
  }) = Initialized;
}
