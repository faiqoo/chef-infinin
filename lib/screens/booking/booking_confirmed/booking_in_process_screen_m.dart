import 'package:chef/base/base.dart';
import 'package:chef/models/booking/booking_list_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/booking/advance_pending_response.dart';

part 'booking_in_process_screen_m.freezed.dart';

@freezed
class BookingInProcessScreenState extends BaseState
    with _$BookingInProcessScreenState {
  const factory BookingInProcessScreenState.loading() = Loading;
  const factory BookingInProcessScreenState.loaded(
      AdvancePendingResponse advancePendingResponse) = Loaded;
}
