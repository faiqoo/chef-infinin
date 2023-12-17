import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chef/base/base.dart';

// import '../../models/signup/profession_response.dart';

part 'edit_profile_screen_m.freezed.dart';

@freezed
class EditProfileScreenState extends BaseState with _$EditProfileScreenState {
  const factory EditProfileScreenState.initialized({
    required String mobileNumber,
    required bool isBusy,
    @Default('') String errorMessage,
  }) = Initialized;
}
