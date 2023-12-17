import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chef/base/base.dart';
import 'package:chef/models/models.dart';

part 'profile_information_screen_m.freezed.dart';

@freezed
class ProfileInformationScreenState extends BaseState
    with _$ProfileInformationScreenState {
  const factory ProfileInformationScreenState.initialized(User? user) =
      Initialized;
}
