import 'package:chef/base/base_viewmodel.dart';
import 'package:chef/helpers/url_helper.dart';
import 'package:chef/models/booking/booking_list_request.dart' as baserequest;
import 'package:chef/models/booking/booking_list_response_model.dart';
import 'package:chef/screens/booking/booking_list/booking_list_screen_m.dart';
import 'package:chef/services/network/network_service.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../constants/api.dart';
import '../../../services/application_state.dart';
import '../../../setup.dart';

import 'dart:developer' as developer;

@injectable
class BookingListScreenViewModel extends BaseViewModel<BookingListState> {
  BookingListScreenViewModel({
    required INetworkService network,
  })  : _network = network,
        super(const Loading());

  final INetworkService _network;

  late BookingListModel bookingListModel;

  Future<void> getBookingListData() async {
    // final url =
    //     InfininURLHelpers.getRestApiURL(Api.baseURL + Api.bookingListData);

    final url =
        InfininURLHelpers.getRestApiURL(Api.baseURL + Api.bookingListData);
    final _appService = locateService<ApplicationService>();

    String _userId = (_appService.state.userInfo?.t.id.toString())! ?? '45';

    developer.log(' User Id is ' + '${_appService.state.userInfo?.t.id}');

    emit(const Loading());

    final bookingListRequest = baserequest.BookingListRequest(
      userId: int.parse(_userId),
    ).toJson();

    final response = await _network.post(
      path: url,
      data: bookingListRequest,
    );

    bookingListModel = bookingListModelFromJson(response.body);

    response.body != "" || response.body != null
        ? emit(Loaded(bookingListModel))
        : emit(const Loading());
  }
}
