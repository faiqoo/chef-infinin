import 'package:chef/base/base.dart';
import 'package:chef/models/booking/booking_list_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/booking/advance_pending_response.dart';

part 'food_item_advance_payment_m.freezed.dart';

@freezed
class FoodItemAdvancePaymentState extends BaseState
    with _$FoodItemAdvancePaymentState {
  const factory FoodItemAdvancePaymentState.loading() = Loading;
  const factory FoodItemAdvancePaymentState.loaded(
      AdvancePendingResponse advancePendingResponse) = Loaded;
}
