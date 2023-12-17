import 'package:chef/helpers/helpers.dart';
import 'package:chef/screens/booking/booking_list/booking_list_screen_m.dart';
import 'package:chef/screens/booking/booking_list/booking_list_screen_vm.dart';
import 'package:chef/screens/booking/food_item_booking.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../setup.dart';

class BookingListScreen extends BaseView<BookingListScreenViewModel> {
  BookingListScreen({Key? key}) : super(key: key);

  @override
  Widget buildScreen(
      {required BuildContext context, required ScreenSizeData screenSizeData}) {
    final appTheme = AppTheme.of(context).theme;

    return BlocBuilder<BookingListScreenViewModel, BookingListState>(
        bloc: viewModel..getBookingListData(),
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
    return FoodItemBooking(bookingListModel: bookingListModel);
  }
}
