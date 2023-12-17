import 'package:chef/base/base.dart';
import 'package:chef/models/booking/booking_list_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_list_screen_m.freezed.dart';

@freezed
class BookingListState extends BaseState with _$BookingListState {
  const factory BookingListState.loading() = Loading;
  const factory BookingListState.loaded(
      BookingListModel bookingListModel) = Loaded;
}
