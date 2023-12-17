import 'package:chef/screens/home/food_details_menu_model.dart';
import 'package:chef/screens/home/schedule_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:chef/base/base.dart';
part 'food_product_details_screen_m.freezed.dart';

@freezed
class FoodProductDetailScreenState extends BaseState
    with _$FoodProductDetailScreenState {
  const factory FoodProductDetailScreenState.loading() = Loading;
  const factory FoodProductDetailScreenState.loaded() = Loaded;
}
