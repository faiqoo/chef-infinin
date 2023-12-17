import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chef/base/base.dart';

import '../../models/home/experience_list_response.dart';
import 'food_details_menu_model.dart';

part 'home_screen_m.freezed.dart';

@freezed
class HomeScreenState extends BaseState with _$HomeScreenState {
  const factory HomeScreenState.initialized() = Initialized;
  const factory HomeScreenState.loading() = Loading;
  const factory HomeScreenState.loaded(
    ExperienceListResponse experienceListResponse,
  ) = Loaded;
  // const factory HomeScreenState.error() = Error;
}
