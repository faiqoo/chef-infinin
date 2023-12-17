import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chef/base/base.dart';

import '../../models/signup/profession_response.dart';

part 'sign_up_screen_m.freezed.dart';

@freezed
class SignUpScreenState extends BaseState with _$SignUpScreenState {
  const factory SignUpScreenState.loading() = Loading;
  const factory SignUpScreenState.loaded(List<ProfessionData> data) = Loaded;
}
