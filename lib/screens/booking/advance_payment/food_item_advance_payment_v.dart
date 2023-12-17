import 'package:chef/helpers/helpers.dart';
import 'package:chef/screens/booking/booking_list/booking_list_screen_m.dart';
import 'package:chef/screens/booking/booking_list/booking_list_screen_vm.dart';
import 'package:chef/screens/booking/food_item_booking.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/booking/booking_list_response_model.dart';
import '../../../setup.dart';
import 'food_item_advance_payment_m.dart';
import 'food_item_advance_payment_vm.dart';

class FoodItemAdvancePaymentScreen
    extends BaseView<FoodItemAdvancePaymentViewModel> {
  FoodItemAdvancePaymentScreen({required BookingItem bookingItem, Key? key})
      : _bookingItem = bookingItem,
        super(key: key);

  BookingItem _bookingItem;

  @override
  Widget buildScreen(
      {required BuildContext context, required ScreenSizeData screenSizeData}) {
    final appTheme = AppTheme.of(context).theme;

    return BlocBuilder<FoodItemAdvancePaymentViewModel,
            FoodItemAdvancePaymentState>(
        bloc: viewModel..getBookingDetails((_bookingItem.id)!),
        builder: (context, state) {
          return Scaffold(
            backgroundColor: appTheme.colors.primaryBackground,
            body: state.when(
                loading: _loading,
                loaded: (bookingListModel) => displayLoaded(bookingListModel)),
          );
        });
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget displayLoaded(bookingListModel) {
    // return Container();
    // return Container();
    final _navigate = locateService<INavigationService>();
    _navigate.navigateTo(
        route: FoodProductAdvancePendingDetails(
            advancePendingDetails: bookingListModel));
    return Container();
    //   return FoodProductAdvancePendingDetails(advancePendingDetails: );
  }
}
