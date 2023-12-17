import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';

import 'package:chef/constants/constants.dart';
import 'package:chef/screens/bottom_bar/bottom_bar.dart';
import 'package:chef/screens/screen.dart';
import 'package:chef/screens/sign_in/sign_in_screen_v.dart';
import 'package:chef/screens/sign_up/get_started_screen_v.dart';

import '../../screens/booking/advance_payment/food_item_advance_payment_v.dart';
import '../../screens/booking/booking_confirmed/booking_in_process_screen_v.dart';
import '../../screens/booking/booking_in_process_screen.dart';
import '../../screens/booking/food_item_advance_booking.dart';
import '../../screens/home/food_item_booking_confirmed.dart';
import '../../screens/sign_up/sign_up_screen_v.dart';

export 'router.gr.dart';

abstract class Routes {
  static const login = '/login';
  static const signUp = '/signUp';
  static const bottomBar = '/bottomBar';
  static const forgotPassword = '/forgotPassword';
  static const splash = '/splash';
  static const home = '/home';
  static const profile = '/profile';
  static const dashboard = '/dashboard';
  static const foodProductAdvancePendingDetails =
      '/foodProductAdvancePendingDetails/:advancePendingDetails';
  static const foodItemAdvancePaymentScreen =
      '/foodItemAdvancePaymentScreen/:bookingItem';

  static const foodInProcessScreen = '/foodInProcessScreen/:bookedItem';

  static const foodItemInProcessScreen = '/foodItemInProcessScreen';
  static const foodProductBookingConfirmedDetailsScreen =
      '/foodProductBookingConfirmedDetailsScreen/:bookingConfirmedDetails';
  static const records = '/forms/:formId';
  static const customForm = '/custom_form/:${Strings.formIdParam}';
  static const mainProfile = '/main_profile';
  static const profileSwitcher = '/profile_switcher';
  static const profileInformation = '/profile_information';
  static const changePassword = '/change_password';
  static const accountSettings = '/account_settings';
  static const getStartedScreen = '/get_started_screen';
}

@MaterialAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashScreen,
      initial: true,
    ),
    AutoRoute(
      page: GetStartedScreen,
      path: Routes.getStartedScreen,
    ),
    AutoRoute(
      page: SignUpScreen,
      path: Routes.signUp,
    ),
    AutoRoute(
      page: ForgotPasswordScreen,
      path: Routes.forgotPassword,
    ),
    AutoRoute(
      page: SignInScreen,
      path: Routes.login,
    ),
    AutoRoute(
      page: FoodProductAdvancePendingDetails,
      path: Routes.foodProductAdvancePendingDetails,
    ),

    AutoRoute(
      page: FoodItemAdvancePaymentScreen,
      path: Routes.foodItemAdvancePaymentScreen,
    ),
    AutoRoute(
      page: BookingInProcessScreenView,
      path: Routes.foodInProcessScreen,
    ),

    AutoRoute(
      page: FoodItemInProcessBooking,
      path: Routes.foodItemInProcessScreen,
    ),

    AutoRoute(
      page: FoodProductBookingConfirmedDetails,
      path: Routes.foodProductBookingConfirmedDetailsScreen,
    ),

    AutoRoute(
      page: BottomBar,
      path: Routes.bottomBar,
    ),
    // AutoRoute(
    //   page: HomeScreen,
    //   path: Routes.home,
    // ),
    RedirectRoute(
      path: '*',
      redirectTo: '/',
    ),
  ],
)
class $AppRouter {}
