import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chef/base/base.dart';

part 'splash_screen_m.freezed.dart';

@freezed
class SplashScreenState extends BaseState with _$SplashScreenState {
  const factory SplashScreenState.initialized() = Initialized;
}
