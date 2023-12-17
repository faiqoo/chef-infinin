import 'package:chef/helpers/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/booking/booking_list_response_model.dart';
import '../../../setup.dart';
// import '../booking_in_process_screen.dart';
import 'booking_in_process_screen_m.dart';
import 'booking_in_process_screen_vm.dart';

class BookingInProcessScreenView
    extends BaseView<BookingInProcessScreenViewModel> {
  BookingInProcessScreenView({required BookingItem bookingItem, Key? key})
      : _bookingItem = bookingItem,
        super(key: key);

  BookingItem _bookingItem;

  @override
  Widget buildScreen(
      {required BuildContext context, required ScreenSizeData screenSizeData}) {
    final appTheme = AppTheme.of(context).theme;

    return BlocBuilder<BookingInProcessScreenViewModel,
            BookingInProcessScreenState>(
        bloc: viewModel..getBookingDetails((_bookingItem.id)!),
        builder: (context, state) {
          return Scaffold(
            backgroundColor: appTheme.colors.primaryBackground,
            body: state.when(
                loading: _loading,
                loaded: (bookingConfirmedDetails) =>
                    displayLoaded(bookingConfirmedDetails)),
          );
        });
  }

  Widget _loading() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget displayLoaded(bookingConfirmedDetails) {
    // return Container();
    // return Container();
    final _navigate = locateService<INavigationService>();

    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) {
    //   return const FoodItemInProcessBooking();
    // }));
    _navigate.navigateTo(
        route: FoodProductBookingConfirmedDetails(
            advancePendingDetails: viewModel.advancePendingResponse));
    return Container();
    //   return FoodProductAdvancePendingDetails(advancePendingDetails: );
  }
}
