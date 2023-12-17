import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chef/base/base.dart';

import '../../models/signup/profession_response.dart';

part 'sign_in_screen_m.freezed.dart';

@freezed
class SignInScreenState extends BaseState with _$SignInScreenState {
  const factory SignInScreenState.initialized({
    required String mobileNumber,
    required bool isBusy,
    @Default('') String errorMessage,
  }) = Initialized;
}
