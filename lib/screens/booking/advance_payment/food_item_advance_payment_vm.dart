import 'package:chef/base/base_viewmodel.dart';
import 'package:chef/helpers/helpers.dart';
import 'package:chef/helpers/url_helper.dart';
// import 'package:chef/models/booking/booking_list_request.dart' as baserequest;
// import 'package:chef/models/booking/booking_list_response_model.dart';
// import 'package:chef/screens/booking/booking_list/booking_list_screen_m.dart';
import 'package:chef/services/network/network_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../constants/api.dart';
import '../../../models/booking/advance_pending_response.dart';
// import '../../../models/booking/advance_pending_response.dart';
import '../../../models/booking/confirmed_booking_response.dart';
import '../../../models/signup/signup_request.dart' as request;
import '../../../helpers/data_request.dart' as data;
import '../../../services/application_state.dart';
import '../../../setup.dart';
import 'food_item_advance_payment_m.dart';

import 'dart:developer' as developer;

@injectable
class FoodItemAdvancePaymentViewModel
    extends BaseViewModel<FoodItemAdvancePaymentState> {
  FoodItemAdvancePaymentViewModel({
    required INetworkService network,
  })  : _network = network,
        super(const Loading());

  final INetworkService _network;

  late AdvancePendingResponse advancePendingResponse;

  late ConfirmedBookingResponse confirmedBookingResponse;

  Future<void> getBookingDetails(int _orderId) async {
    final url = InfininURLHelpers.getRestApiURL(
        Api.baseURL + Api.bookingDetailsAdvancePaymentPending);

    emit(const Loading());
    final response = await _network.post(
      path: url,
      data: {'t': _orderId},
    );

    advancePendingResponse = advancePendingResponseFromJson(response.body);

    response.body != "" || response.body != null
        ? emit(Loaded(advancePendingResponse))
        : emit(const Loading());
  }

  Future<void> requestConfirmBooking(int bookingId) async {
    final url =
        InfininURLHelpers.getRestApiURL(Api.baseURL + Api.confirmBooking);
    final _appService = locateService<ApplicationService>();
    final _navigate = locateService<INavigationService>();

    emit(const Loading());

    final response = await _network.post(
      path: url,
      data: {'t': bookingId},
    );

    developer.log(' Response of confirm is ' + '${response.body}');

    confirmedBookingResponse = confirmedBookingResponseFromJson(response.body);

    _navigate.navigateTo(route: const BottomBar());
  }
}
