import 'package:chef/screens/home/food_details_menu_model.dart';
import 'package:chef/screens/home/schedule_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chef/base/base.dart';

import '../../../models/perferences/perference_response.dart';
part 'food_detail_screen_m.freezed.dart';

@freezed
class FoodDetailScreenState extends BaseState with _$FoodDetailScreenState {
  const factory FoodDetailScreenState.loading() = Loading;
  const factory FoodDetailScreenState.loaded(
      FoodMenuModel foodMenuModel, ScheduleModel scheduleModel) = Loaded;
}
